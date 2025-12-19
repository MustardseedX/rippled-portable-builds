#!/bin/bash

# Repository Audit Script for rippled-portable-builds
# Performs comprehensive security and integrity checks on the entire repository

set -e

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

AUDIT_LOG="audit-$(date +%Y%m%d-%H%M%S).log"
ISSUES_FOUND=0

# Redirect output to both console and log file
exec > >(tee -a "$AUDIT_LOG")
exec 2>&1

echo "========================================"
echo "Repository Security Audit"
echo "========================================"
echo "Date: $(date)"
echo "Repository: rippled-portable-builds"
echo "Log file: $AUDIT_LOG"
echo ""

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓ PASS${NC}: $1"
}

print_error() {
    echo -e "${RED}✗ FAIL${NC}: $1"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
}

print_warning() {
    echo -e "${YELLOW}⚠ WARN${NC}: $1"
}

print_info() {
    echo -e "${BLUE}ℹ INFO${NC}: $1"
}

print_section() {
    echo ""
    echo "----------------------------------------"
    echo "$1"
    echo "----------------------------------------"
}

# 1. Check for sensitive files
print_section "1. Checking for Sensitive Files"

SENSITIVE_PATTERNS=(
    "*.key"
    "*.pem"
    "*_rsa"
    "*.gpg-secret"
    ".env"
    "*secret*"
    "*password*"
    "*credential*"
)

FOUND_SENSITIVE=0
for pattern in "${SENSITIVE_PATTERNS[@]}"; do
    files=$(find . -name "$pattern" -type f 2>/dev/null || true)
    if [ -n "$files" ]; then
        print_error "Found sensitive file pattern: $pattern"
        echo "$files"
        FOUND_SENSITIVE=1
    fi
done

if [ $FOUND_SENSITIVE -eq 0 ]; then
    print_success "No sensitive files found"
fi

# 2. Verify binary signatures
print_section "2. Verifying Binary Signatures"

EXPECTED_FINGERPRINT="6D7040170DEA4F69DEF5D569B6F97CF21A962003"

# Check if GPG is available
if ! command -v gpg &> /dev/null; then
    print_warning "GPG not available, skipping signature verification"
else
    # Check if key is imported
    if gpg --list-keys "$EXPECTED_FINGERPRINT" &> /dev/null 2>&1; then
        print_info "XRPLF GPG key is imported"
        
        # Verify each binary
        if [ -d "releases" ]; then
            BINARY_COUNT=0
            VERIFIED_COUNT=0
            
            for binary in releases/rippled-portable-*; do
                # Skip signature and checksum files
                if [[ "$binary" == *.sig ]] || [[ "$binary" == *.sha512sum ]]; then
                    continue
                fi
                
                if [ -f "$binary" ]; then
                    BINARY_COUNT=$((BINARY_COUNT + 1))
                    sig_file="${binary}.sig"
                    
                    if [ -f "$sig_file" ]; then
                        print_info "Verifying $(basename $binary)..."
                        if gpg --verify "$sig_file" "$binary" &> /dev/null; then
                            print_success "Signature valid for $(basename $binary)"
                            VERIFIED_COUNT=$((VERIFIED_COUNT + 1))
                        else
                            print_error "Signature invalid for $(basename $binary)"
                        fi
                    else
                        print_error "Missing signature file for $(basename $binary)"
                    fi
                fi
            done
            
            print_info "Verified $VERIFIED_COUNT out of $BINARY_COUNT binaries"
        else
            print_error "releases/ directory not found"
        fi
    else
        print_warning "XRPLF GPG key not imported, cannot verify signatures"
        print_info "Import key with: gpg --import xrplf-binary-packages-public.gpg"
    fi
fi

# 3. Verify checksums
print_section "3. Verifying SHA-512 Checksums"

if command -v sha512sum &> /dev/null; then
    if [ -d "releases" ]; then
        for checksum_file in releases/*.sha512sum; do
            if [ -f "$checksum_file" ]; then
                binary="${checksum_file%.sha512sum}"
                
                if [ -f "$binary" ]; then
                    print_info "Verifying checksum for $(basename $binary)..."
                    stored_sum=$(cat "$checksum_file" | awk '{print $1}')
                    actual_sum=$(sha512sum "$binary" | awk '{print $1}')
                    
                    if [ "$stored_sum" = "$actual_sum" ]; then
                        print_success "Checksum valid for $(basename $binary)"
                    else
                        print_error "Checksum mismatch for $(basename $binary)"
                        echo "  Stored:  $stored_sum"
                        echo "  Actual:  $actual_sum"
                    fi
                else
                    print_warning "Binary file missing for checksum: $(basename $binary)"
                fi
            fi
        done
    else
        print_error "releases/ directory not found"
    fi
else
    print_warning "sha512sum not available, skipping checksum verification"
fi

# 4. Check file permissions
print_section "4. Checking File Permissions"

if [ -d "releases" ]; then
    for binary in releases/rippled-portable-*; do
        # Skip signature and checksum files
        if [[ "$binary" == *.sig ]] || [[ "$binary" == *.sha512sum ]]; then
            continue
        fi
        
        if [ -f "$binary" ]; then
            if [ -x "$binary" ]; then
                print_success "$(basename $binary) is executable"
            else
                print_warning "$(basename $binary) is not executable (should be chmod +x)"
            fi
            
            # Check for setuid/setgid (security risk)
            if [ -u "$binary" ] || [ -g "$binary" ]; then
                print_error "$(basename $binary) has setuid/setgid bit set (security risk!)"
            fi
        fi
    done
else
    print_error "releases/ directory not found"
fi

# 5. Check for large or unexpected files
print_section "5. Checking for Large or Unexpected Files"

# Find large files (>100MB)
print_info "Searching for files larger than 100MB..."
large_files=$(find . -type f -size +100M 2>/dev/null || true)
if [ -n "$large_files" ]; then
    print_warning "Found large files:"
    echo "$large_files"
else
    print_success "No unusually large files found"
fi

# 6. Verify documentation exists
print_section "6. Verifying Documentation"

REQUIRED_DOCS=(
    "README.md"
    "SECURITY.md"
    "CODE_OF_CONDUCT.md"
    "CONTRIBUTING.md"
    "GOVERNANCE.md"
    "LICENSE"
)

for doc in "${REQUIRED_DOCS[@]}"; do
    if [ -f "$doc" ]; then
        print_success "$doc exists"
    else
        print_error "$doc is missing"
    fi
done

# 7. Check for hardcoded secrets in scripts
print_section "7. Scanning Scripts for Hardcoded Secrets"

SECRET_PATTERNS=(
    "password.*=.*['\"]"
    "api[_-]?key.*=.*['\"]"
    "secret.*=.*['\"]"
    "token.*=.*['\"]"
    "BEGIN.*PRIVATE.*KEY"
)

FOUND_SECRETS=0
for pattern in "${SECRET_PATTERNS[@]}"; do
    results=$(grep -rn "$pattern" . --include="*.sh" --include="*.cfg" 2>/dev/null || true)
    if [ -n "$results" ]; then
        print_warning "Potential hardcoded secret pattern found: $pattern"
        echo "$results"
        FOUND_SECRETS=1
    fi
done

if [ $FOUND_SECRETS -eq 0 ]; then
    print_success "No obvious hardcoded secrets found in scripts"
fi

# 8. Verify .gitignore exists and is comprehensive
print_section "8. Checking .gitignore"

if [ -f ".gitignore" ]; then
    print_success ".gitignore exists"
    
    # Check for important patterns
    REQUIRED_PATTERNS=(
        "*.key"
        "*.pem"
        ".env"
    )
    
    for pattern in "${REQUIRED_PATTERNS[@]}"; do
        if grep -q "$pattern" .gitignore 2>/dev/null; then
            print_success ".gitignore includes $pattern"
        else
            print_warning ".gitignore should include $pattern"
        fi
    done
else
    print_error ".gitignore is missing"
fi

# 9. Check Git configuration
print_section "9. Checking Git Configuration"

# Check for signed commits (if available)
if git log --show-signature -1 &>/dev/null; then
    print_info "Latest commit signature status:"
    git log --show-signature -1 --pretty=format:"%h %s" | head -1
else
    print_warning "Commits are not signed with GPG"
fi

# 10. File integrity check
print_section "10. File Integrity Summary"

total_binaries=$(find releases -name "rippled-portable-*" ! -name "*.sig" ! -name "*.sha512sum" -type f 2>/dev/null | wc -l)
total_signatures=$(find releases -name "*.sig" -type f 2>/dev/null | wc -l)
total_checksums=$(find releases -name "*.sha512sum" -type f 2>/dev/null | wc -l)

print_info "Total binaries: $total_binaries"
print_info "Total signatures: $total_signatures"
print_info "Total checksums: $total_checksums"

if [ "$total_binaries" -eq "$total_signatures" ]; then
    print_success "All binaries have signatures"
else
    print_error "Binary/signature count mismatch"
fi

# Final summary
print_section "Audit Summary"

echo ""
if [ $ISSUES_FOUND -eq 0 ]; then
    print_success "Audit completed successfully with no critical issues"
    echo ""
    echo "Status: ${GREEN}PASS${NC}"
    EXIT_CODE=0
else
    print_error "Audit found $ISSUES_FOUND issue(s)"
    echo ""
    echo "Status: ${RED}FAIL${NC}"
    EXIT_CODE=1
fi

echo ""
echo "Full audit log saved to: $AUDIT_LOG"
echo "========================================"

exit $EXIT_CODE

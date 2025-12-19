#!/bin/bash

# Binary Verification Script for rippled-portable-builds
# This script helps verify the authenticity and integrity of rippled binaries

set -e

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Expected GPG fingerprint
EXPECTED_FINGERPRINT="6D7040170DEA4F69DEF5D569B6F97CF21A962003"
GPG_KEY_URL="https://raw.githubusercontent.com/XRPLF/rippled-portable-builds/main/xrplf-binary-packages-public.gpg"

echo "========================================="
echo "rippled Binary Verification Script"
echo "========================================="
echo ""

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_info() {
    echo "ℹ $1"
}

# Check if file argument provided
if [ $# -eq 0 ]; then
    print_error "No binary file specified"
    echo ""
    echo "Usage: $0 <rippled-portable-binary>"
    echo "Example: $0 rippled-portable-2.1.1"
    echo ""
    echo "This script will verify:"
    echo "  1. GPG signature"
    echo "  2. SHA-512 checksum (if available)"
    echo "  3. File permissions"
    echo "  4. Basic binary integrity"
    exit 1
fi

BINARY_FILE="$1"
SIG_FILE="${BINARY_FILE}.sig"
CHECKSUM_FILE="${BINARY_FILE}.sha512sum"

echo "Verifying: $BINARY_FILE"
echo ""

# Check if binary exists
if [ ! -f "$BINARY_FILE" ]; then
    print_error "Binary file not found: $BINARY_FILE"
    exit 1
fi

print_success "Binary file exists"

# Check if signature file exists
if [ ! -f "$SIG_FILE" ]; then
    print_error "Signature file not found: $SIG_FILE"
    print_warning "Cannot verify without signature file"
    exit 1
fi

print_success "Signature file exists"

# Check if gpg is installed
if ! command -v gpg &> /dev/null; then
    print_error "GPG is not installed"
    echo "Please install GPG (gnupg) to verify signatures"
    exit 1
fi

print_success "GPG is installed"

# Check if key is imported
KEY_IMPORTED=0
if gpg --list-keys "$EXPECTED_FINGERPRINT" &> /dev/null; then
    print_success "XRPLF GPG key is already imported"
    KEY_IMPORTED=1
else
    print_warning "XRPLF GPG key not found in keyring"
    echo ""
    read -p "Download and import official GPG key? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_info "Downloading GPG key from $GPG_KEY_URL..."
        if curl -sSL -o /tmp/xrplf-key.gpg "$GPG_KEY_URL"; then
            print_success "GPG key downloaded"
            print_info "Importing GPG key..."
            if gpg --import /tmp/xrplf-key.gpg; then
                print_success "GPG key imported"
                KEY_IMPORTED=1
                rm /tmp/xrplf-key.gpg
            else
                print_error "Failed to import GPG key"
                exit 1
            fi
        else
            print_error "Failed to download GPG key"
            exit 1
        fi
    else
        print_error "Cannot verify signature without GPG key"
        exit 1
    fi
fi

# Verify fingerprint
print_info "Verifying GPG key fingerprint..."
ACTUAL_FINGERPRINT=$(gpg --fingerprint "$EXPECTED_FINGERPRINT" 2>/dev/null | grep -o '[0-9A-F]\{40\}' | tr -d ' ')

if [ "$ACTUAL_FINGERPRINT" = "$(echo $EXPECTED_FINGERPRINT | tr -d ' ')" ]; then
    print_success "GPG key fingerprint verified: $EXPECTED_FINGERPRINT"
else
    print_error "GPG key fingerprint mismatch!"
    echo "Expected: $EXPECTED_FINGERPRINT"
    echo "Actual:   $ACTUAL_FINGERPRINT"
    exit 1
fi

# Verify signature
echo ""
print_info "Verifying GPG signature..."
echo "---"
if gpg --verify "$SIG_FILE" "$BINARY_FILE" 2>&1; then
    echo "---"
    print_success "GPG signature is valid"
else
    echo "---"
    print_error "GPG signature verification failed!"
    print_warning "This binary may be compromised or tampered with"
    exit 1
fi

# Verify checksum if available
echo ""
if [ -f "$CHECKSUM_FILE" ]; then
    print_info "Verifying SHA-512 checksum..."
    if sha512sum -c "$CHECKSUM_FILE" 2>&1 | grep -q "OK"; then
        print_success "SHA-512 checksum verified"
    else
        print_error "SHA-512 checksum verification failed!"
        exit 1
    fi
else
    print_warning "No SHA-512 checksum file found (optional)"
fi

# Check file permissions
echo ""
print_info "Checking file permissions..."
if [ -x "$BINARY_FILE" ]; then
    print_success "Binary is executable"
else
    print_warning "Binary is not executable"
    echo "Run: chmod +x $BINARY_FILE"
fi

# Basic binary checks
echo ""
print_info "Performing basic integrity checks..."

# Check if file is not empty
if [ -s "$BINARY_FILE" ]; then
    FILE_SIZE=$(ls -lh "$BINARY_FILE" | awk '{print $5}')
    print_success "Binary is not empty (Size: $FILE_SIZE)"
else
    print_error "Binary file is empty"
    exit 1
fi

# Check if it's a valid ELF binary (Linux)
if file "$BINARY_FILE" | grep -q "ELF"; then
    print_success "Valid ELF binary detected"
    BINARY_ARCH=$(file "$BINARY_FILE" | grep -o "x86-64\|x86_64\|i386\|ARM\|aarch64")
    if [ -n "$BINARY_ARCH" ]; then
        print_info "Architecture: $BINARY_ARCH"
    fi
else
    print_warning "Not an ELF binary (may be for different platform)"
fi

# Summary
echo ""
echo "========================================="
echo "Verification Summary"
echo "========================================="
print_success "All critical checks passed"
echo ""
print_info "Binary: $BINARY_FILE"
print_info "Signature: Valid"
print_info "Fingerprint: Verified"
if [ -f "$CHECKSUM_FILE" ]; then
    print_info "Checksum: Verified"
fi
echo ""
print_success "This binary is authentic and safe to use"
echo ""
echo "Next steps:"
echo "  1. Make executable: chmod +x $BINARY_FILE"
echo "  2. Review installation guide: README.md"
echo "  3. Test in non-production first"
echo ""
print_warning "Always follow security best practices"
echo "========================================="

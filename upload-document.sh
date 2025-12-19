#!/bin/bash

# Document Upload Helper Script
# This script helps you easily upload documents to the repository

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "========================================"
echo "Document Upload Helper"
echo "========================================"
echo ""

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Function to show menu
show_menu() {
    echo "What type of document do you want to upload?"
    echo ""
    echo "1) Tutorial or Guide"
    echo "2) Example Configuration"
    echo "3) Troubleshooting Document"
    echo "4) Platform-Specific Guide"
    echo "5) Image or Diagram"
    echo "6) Template File"
    echo "7) Other Documentation"
    echo "8) Exit"
    echo ""
}

# Function to get directory based on choice
get_directory() {
    case $1 in
        1) echo "docs/tutorials" ;;
        2) echo "docs/examples" ;;
        3) echo "docs/troubleshooting" ;;
        4) echo "docs/platform-guides" ;;
        5) echo "docs/images" ;;
        6) echo "docs/templates" ;;
        7) echo "docs" ;;
        *) echo "" ;;
    esac
}

# Function to get file extension recommendation
get_extension_recommendation() {
    case $1 in
        1|3|4|7) echo ".md (Markdown)" ;;
        2) echo ".cfg or .md" ;;
        5) echo ".png, .jpg, .svg" ;;
        6) echo ".cfg, .sh, .service" ;;
        *) echo "appropriate extension" ;;
    esac
}

# Main upload function
upload_document() {
    local choice=$1
    local target_dir=$(get_directory $choice)
    local ext_rec=$(get_extension_recommendation $choice)
    
    if [ -z "$target_dir" ]; then
        print_error "Invalid choice"
        return 1
    fi
    
    # Create directory if it doesn't exist
    mkdir -p "$target_dir"
    
    echo ""
    print_info "Target directory: $target_dir"
    print_info "Recommended extension: $ext_rec"
    echo ""
    
    # Get source file
    read -p "Enter the path to your file (or drag and drop here): " source_file
    source_file="${source_file// /}"  # Remove spaces
    source_file="${source_file//\'/}"  # Remove quotes
    
    if [ ! -f "$source_file" ]; then
        print_error "File not found: $source_file"
        return 1
    fi
    
    print_success "File found: $(basename "$source_file")"
    
    # Get destination filename
    local default_name=$(basename "$source_file")
    read -p "Enter destination filename (press Enter for '$default_name'): " dest_name
    
    if [ -z "$dest_name" ]; then
        dest_name=$default_name
    fi
    
    # Construct full destination path
    local dest_path="$target_dir/$dest_name"
    
    # Check if file already exists
    if [ -f "$dest_path" ]; then
        print_warning "File already exists: $dest_path"
        read -p "Overwrite? (y/n): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Upload cancelled"
            return 1
        fi
    fi
    
    # Copy file
    cp "$source_file" "$dest_path"
    print_success "File copied to: $dest_path"
    
    # Add description
    echo ""
    read -p "Enter a brief description for commit message: " description
    
    if [ -z "$description" ]; then
        description="Add $(basename "$dest_path")"
    fi
    
    # Show summary
    echo ""
    echo "========================================"
    echo "Upload Summary"
    echo "========================================"
    echo "Source: $source_file"
    echo "Destination: $dest_path"
    echo "Description: $description"
    echo ""
    
    # Ask if user wants to commit
    read -p "Do you want to add this to git? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add "$dest_path"
        print_success "File staged for commit"
        echo ""
        print_info "To commit, run:"
        echo "  git commit -m \"docs: $description\""
        echo ""
        print_info "To push, run:"
        echo "  git push origin <your-branch-name>"
    else
        print_info "File copied but not added to git"
        print_info "You can manually add it later with: git add $dest_path"
    fi
    
    echo ""
    return 0
}

# Create README files in directories
create_readme_files() {
    local docs_dir="docs"
    
    # Main docs README
    if [ ! -f "$docs_dir/README.md" ]; then
        cat > "$docs_dir/README.md" << 'EOF'
# Documentation

This directory contains additional documentation for rippled-portable-builds.

## Directory Structure

- **tutorials/** - Step-by-step guides and tutorials
- **examples/** - Example configurations and use cases
- **troubleshooting/** - Problem-solving guides and FAQs
- **platform-guides/** - Platform-specific installation guides
- **templates/** - Configuration templates and boilerplate files
- **images/** - Images, diagrams, and screenshots

## Contributing

See [DOCUMENT_UPLOAD_GUIDE.md](../DOCUMENT_UPLOAD_GUIDE.md) for information on contributing documentation.

You can also use the upload helper script:
```bash
./upload-document.sh
```

## Quick Links

- [Quick Start Guide](../QUICK_START.md)
- [Security Policy](../SECURITY.md)
- [Contributing Guidelines](../CONTRIBUTING.md)
EOF
        print_success "Created docs/README.md"
    fi
    
    # Subdirectory READMEs
    local subdirs=("tutorials" "examples" "troubleshooting" "platform-guides" "templates" "images")
    local descriptions=(
        "Step-by-step guides and tutorials"
        "Example configurations and use cases"
        "Problem-solving guides and FAQs"
        "Platform-specific installation guides"
        "Configuration templates and boilerplate files"
        "Images, diagrams, and screenshots"
    )
    
    for i in "${!subdirs[@]}"; do
        local subdir="${subdirs[$i]}"
        local desc="${descriptions[$i]}"
        local readme_path="$docs_dir/$subdir/README.md"
        
        if [ ! -f "$readme_path" ]; then
            cat > "$readme_path" << EOF
# ${subdir^}

${desc}

## Contents

This directory is currently being populated. Check back soon for more content!

## Contributing

To contribute to this section:

1. Use the upload helper script: \`./upload-document.sh\`
2. Or follow the [Document Upload Guide](../../DOCUMENT_UPLOAD_GUIDE.md)

## Need Help?

- Open an issue with the "documentation" label
- See [CONTRIBUTING.md](../../CONTRIBUTING.md)
EOF
            print_success "Created $readme_path"
        fi
    done
}

# Main script
main() {
    # Ensure we're in the repository root
    if [ ! -d ".git" ]; then
        print_error "This script must be run from the repository root"
        exit 1
    fi
    
    # Create directory structure
    mkdir -p docs/{tutorials,examples,troubleshooting,platform-guides,templates,images}
    
    # Create README files
    create_readme_files
    
    # Main loop
    while true; do
        show_menu
        read -p "Select an option (1-8): " choice
        
        case $choice in
            1|2|3|4|5|6|7)
                upload_document $choice
                echo ""
                read -p "Upload another document? (y/n): " -n 1 -r
                echo
                if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                    break
                fi
                ;;
            8)
                print_info "Exiting..."
                break
                ;;
            *)
                print_error "Invalid option. Please select 1-8."
                ;;
        esac
    done
    
    echo ""
    print_success "Upload helper complete!"
    echo ""
    print_info "Next steps:"
    echo "  1. Review your changes: git status"
    echo "  2. Commit changes: git commit -m \"docs: your message\""
    echo "  3. Push to GitHub: git push origin <branch>"
    echo ""
}

# Run main function
main

# Document Upload Guide

This guide explains how to upload documents and assets to fill gaps in the repository documentation.

## Overview

This repository welcomes documentation contributions! If you've identified gaps in our documentation or have assets that would help other users, this guide will help you contribute them.

## What Documents Can You Upload?

### Welcome Contributions

- **Tutorials**: Step-by-step guides for specific use cases
- **Examples**: Configuration examples, deployment scenarios
- **Troubleshooting Guides**: Solutions to common problems
- **Platform-Specific Guides**: Installation on specific Linux distributions
- **Diagrams**: Architecture diagrams, workflow visualizations
- **Screenshots**: UI examples, configuration screenshots
- **Videos**: Tutorial videos (link to external hosting)
- **Templates**: Configuration templates, systemd service files
- **FAQs**: Frequently asked questions and answers

### Document Types by Directory

```
docs/
├── tutorials/           # Step-by-step guides
├── examples/            # Example configurations
├── troubleshooting/     # Problem-solving guides
├── platform-guides/     # Platform-specific instructions
├── diagrams/            # Visual documentation
└── templates/           # Configuration templates
```

## How to Upload Documents

### Method 1: Via Pull Request (Recommended)

1. **Fork the Repository**
   ```bash
   # Click "Fork" on GitHub
   # Clone your fork
   git clone https://github.com/YOUR_USERNAME/rippled-portable-builds.git
   cd rippled-portable-builds
   ```

2. **Create a Branch**
   ```bash
   git checkout -b docs/add-your-document-name
   ```

3. **Add Your Documents**
   ```bash
   # Create docs directory if it doesn't exist
   mkdir -p docs/tutorials
   
   # Add your document
   cp /path/to/your/document.md docs/tutorials/
   
   # Or create a new document
   nano docs/tutorials/my-tutorial.md
   ```

4. **Follow Documentation Standards**
   - Use Markdown format (.md)
   - Include clear headings
   - Add code examples with syntax highlighting
   - Include relevant screenshots or diagrams
   - Test all instructions

5. **Commit Your Changes**
   ```bash
   git add docs/
   git commit -m "docs: Add tutorial for [topic]"
   ```

6. **Push and Create Pull Request**
   ```bash
   git push origin docs/add-your-document-name
   # Then create PR on GitHub
   ```

### Method 2: Via GitHub Web Interface

1. **Navigate to Repository**
   - Go to https://github.com/XRPLF/rippled-portable-builds

2. **Create New File**
   - Click "Add file" → "Create new file"
   - Enter path: `docs/tutorials/my-tutorial.md`
   - Add content in the editor

3. **Propose Changes**
   - Scroll to bottom
   - Add commit message: "docs: Add tutorial for [topic]"
   - Select "Create a new branch"
   - Click "Propose new file"

4. **Create Pull Request**
   - Review changes
   - Click "Create pull request"
   - Fill in description
   - Submit

### Method 3: Via Issue (For Suggestions)

If you have ideas but can't create the document yourself:

1. **Open an Issue**
   - Go to Issues tab
   - Click "New Issue"
   - Use "Documentation" template

2. **Describe the Gap**
   - What documentation is missing?
   - What would it help users do?
   - Any examples or references?

3. **Offer to Help**
   - Indicate if you can write it
   - Or if you have materials to share

## Document Formatting Standards

### Markdown Template

```markdown
# Document Title

Brief description of what this document covers.

## Prerequisites

- Item 1
- Item 2

## Step 1: First Step

Detailed instructions...

\`\`\`bash
# Code example
command here
\`\`\`

## Step 2: Next Step

More instructions...

## Troubleshooting

Common issues and solutions.

## Additional Resources

- [Link 1](url)
- [Link 2](url)
```

### Best Practices

1. **Clear and Concise**
   - Use simple language
   - Break complex topics into steps
   - Include examples

2. **Accurate and Tested**
   - Test all commands
   - Verify all links
   - Update version numbers

3. **Well-Structured**
   - Use consistent headings
   - Include table of contents for long docs
   - Add navigation links

4. **Security-Conscious**
   - Never include credentials
   - Warn about security implications
   - Follow security best practices

5. **Accessible**
   - Use alt text for images
   - Avoid jargon when possible
   - Define technical terms

## File Organization

### Recommended Structure

```
docs/
├── README.md                    # Index of all documentation
├── tutorials/
│   ├── README.md               # Tutorial index
│   ├── basic-installation.md
│   ├── upgrade-guide.md
│   └── validator-setup.md
├── examples/
│   ├── README.md               # Examples index
│   ├── configs/
│   │   ├── mainnet.cfg
│   │   ├── testnet.cfg
│   │   └── validator.cfg
│   └── systemd/
│       └── rippled.service
├── troubleshooting/
│   ├── README.md               # Troubleshooting index
│   ├── common-errors.md
│   ├── network-issues.md
│   └── performance.md
├── platform-guides/
│   ├── README.md               # Platform guides index
│   ├── ubuntu-20.04.md
│   ├── debian-11.md
│   ├── centos-8.md
│   └── rocky-linux-9.md
└── diagrams/
    ├── README.md               # Diagrams index
    ├── architecture.png
    └── deployment-flow.svg
```

### Naming Conventions

- **Files**: Use lowercase with hyphens: `my-document.md`
- **Directories**: Use lowercase, singular form: `tutorial/`, not `tutorials/`
- **Images**: Descriptive names: `installation-step-1.png`

## Asset Guidelines

### Images

- **Format**: PNG for screenshots, SVG for diagrams
- **Size**: Optimize for web (< 1MB per image)
- **Location**: Store in `docs/images/` or subdirectory
- **Naming**: Descriptive: `verification-success-output.png`

### Example

```markdown
![Binary verification success](docs/images/verification-success.png)
```

### Code Examples

- Include language identifier for syntax highlighting
- Test all code before committing
- Add comments for clarity

```markdown
\`\`\`bash
# Verify binary signature
gpg --verify rippled-portable-2.1.1.sig rippled-portable-2.1.1
\`\`\`
```

### External Assets

For large files or videos:

- Host externally (YouTube, Vimeo, Google Drive)
- Link in documentation
- Ensure long-term availability
- Include backup links if possible

## Review Process

### What Reviewers Check

1. **Accuracy**
   - Are instructions correct?
   - Do links work?
   - Are version numbers current?

2. **Completeness**
   - Does it cover the topic thoroughly?
   - Are prerequisites listed?
   - Is troubleshooting included?

3. **Quality**
   - Is it well-written?
   - Is formatting consistent?
   - Are examples clear?

4. **Security**
   - No credentials included?
   - Security warnings present?
   - Follows best practices?

### Timeline

- **Initial Review**: 3-5 business days
- **Feedback**: Via PR comments
- **Approval**: After addressing feedback
- **Merge**: After maintainer approval

## Current Documentation Gaps

### High Priority

These areas need documentation contributions:

- [ ] Ubuntu 22.04 installation guide
- [ ] Debian 12 installation guide
- [ ] Rocky Linux 9 installation guide
- [ ] Migration from package manager install to portable binary
- [ ] Backup and restore procedures
- [ ] Performance tuning guide
- [ ] Monitoring and alerting setup
- [ ] Common error messages and solutions

### Medium Priority

- [ ] Docker deployment guide
- [ ] Kubernetes deployment
- [ ] Automated deployment scripts
- [ ] Log analysis guide
- [ ] Network configuration examples
- [ ] Firewall configuration guide

### Community Requested

Check [Issues](https://github.com/XRPLF/rippled-portable-builds/issues) tagged with `documentation` for specific requests.

## Document Templates

### Tutorial Template

Create `docs/templates/tutorial-template.md`:

```markdown
# [Tutorial Title]

A brief description of what users will learn.

## Prerequisites

- Prerequisite 1
- Prerequisite 2

## Overview

What this tutorial covers and why it's useful.

## Step 1: [First Step Title]

Detailed instructions...

## Step 2: [Next Step Title]

More detailed instructions...

## Verification

How to verify the tutorial worked correctly.

## Troubleshooting

Common issues and solutions.

## Next Steps

What to do after completing this tutorial.

## Additional Resources

- [Resource 1](url)
- [Resource 2](url)
```

### Platform Guide Template

Create `docs/templates/platform-guide-template.md`:

```markdown
# [OS Name and Version] Installation Guide

Guide for installing rippled portable binaries on [OS Name Version].

## System Requirements

- OS version
- Minimum RAM
- Disk space
- Dependencies

## Installation Steps

### 1. Install Dependencies

\`\`\`bash
# Commands for installing dependencies
\`\`\`

### 2. Download and Verify Binary

\`\`\`bash
# Download commands
# Verification commands
\`\`\`

### 3. Install Binary

\`\`\`bash
# Installation commands
\`\`\`

### 4. Configure rippled

\`\`\`bash
# Configuration steps
\`\`\`

### 5. Start and Enable Service

\`\`\`bash
# Service management commands
\`\`\`

## Verification

How to verify installation succeeded.

## Platform-Specific Notes

Any special considerations for this platform.

## Troubleshooting

Platform-specific issues and solutions.
```

## Getting Help

### Questions About Documentation

- **GitHub Discussions**: For general questions
- **Issues**: For documentation bugs or gaps
- **Pull Requests**: For specific feedback on your contribution

### Support

- Review [CONTRIBUTING.md](CONTRIBUTING.md)
- Check [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
- See [SECURITY.md](SECURITY.md) for security-related docs

## Recognition

Contributors to documentation are:
- Credited in commit history
- Listed in contributors section
- Acknowledged in release notes

## Quick Reference

### Common Commands

```bash
# Fork and clone
git clone https://github.com/YOUR_USERNAME/rippled-portable-builds.git

# Create branch
git checkout -b docs/my-contribution

# Add files
mkdir -p docs/tutorials
cp my-doc.md docs/tutorials/

# Commit
git add docs/
git commit -m "docs: Add [description]"

# Push and create PR
git push origin docs/my-contribution
```

### Checklist Before Submitting

- [ ] Document is in Markdown format
- [ ] All instructions tested
- [ ] All links verified
- [ ] No credentials included
- [ ] Images optimized
- [ ] Code examples work
- [ ] Security considerations noted
- [ ] Proper directory structure
- [ ] Descriptive commit message
- [ ] PR description complete

## Examples of Good Documentation

See these examples for reference:
- [QUICK_START.md](QUICK_START.md) - Concise, action-oriented
- [SECURITY.md](SECURITY.md) - Comprehensive, well-structured
- [CONTRIBUTING.md](CONTRIBUTING.md) - Clear guidelines

---

**Thank you for contributing to rippled-portable-builds documentation!** Your contributions help the entire XRPL community.

**Questions?** Open an issue with the "documentation" label.

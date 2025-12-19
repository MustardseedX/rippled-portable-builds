# Contributing to rippled-portable-builds

Thank you for your interest in contributing to the rippled-portable-builds project! This repository provides portable binaries of the rippled server for the XRP Ledger network.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Security First](#security-first)
- [How to Contribute](#how-to-contribute)
- [Contribution Guidelines](#contribution-guidelines)
- [Binary Submission Process](#binary-submission-process)
- [Documentation Contributions](#documentation-contributions)
- [Testing and Verification](#testing-and-verification)
- [Pull Request Process](#pull-request-process)
- [Review Process](#review-process)

## Code of Conduct

This project adheres to a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to the project maintainers.

## Security First

**CRITICAL**: This repository distributes binaries used in production financial infrastructure. Security is paramount.

### Before Contributing

- Read and understand our [Security Policy](SECURITY.md)
- Never commit unsigned binaries
- Never commit private keys or sensitive credentials
- Always verify signatures before submitting
- Report security issues privately (see SECURITY.md)

### Security Checklist

- [ ] All binaries are GPG signed
- [ ] Signatures verified before submission
- [ ] No modifications to signed binaries
- [ ] Documentation is accurate and complete
- [ ] No sensitive information in commits
- [ ] Changes reviewed for security implications

## How to Contribute

### Types of Contributions

We welcome the following types of contributions:

1. **Binary Additions** (Restricted - See process below)
   - New rippled versions from official XRPLF builds
   - Updated signatures for existing versions
   - SHA-512 checksums

2. **Documentation Improvements**
   - Installation instructions
   - Configuration examples
   - Security best practices
   - Troubleshooting guides

3. **Bootstrap Scripts**
   - Bug fixes
   - Compatibility improvements
   - Security enhancements
   - Better error handling

4. **Configuration Files**
   - Improved defaults
   - Better documentation
   - Security hardening

5. **Testing and Verification**
   - Verification scripts
   - Automated testing
   - Platform compatibility reports

### What We Don't Accept

- Modified or unsigned binaries
- Binaries from unofficial sources
- Configuration files with insecure defaults
- Changes that reduce security
- Incomplete or inaccurate documentation

## Contribution Guidelines

### General Guidelines

1. **One Issue Per Pull Request**: Keep changes focused
2. **Descriptive Commits**: Use clear, descriptive commit messages
3. **Test Your Changes**: Verify everything works as expected
4. **Update Documentation**: Keep docs in sync with changes
5. **Follow Existing Patterns**: Match existing code style

### Commit Messages

Use clear, descriptive commit messages:

```
Add rippled 2.2.0 portable binary and signature

- Add rippled-portable-2.2.0 binary from XRPLF release
- Add corresponding GPG signature file
- Verify signature matches official XRPLF key
- Update README with new version
```

Format:
- First line: Brief summary (50 chars or less)
- Blank line
- Detailed description with bullet points
- Reference any related issues

### Branch Naming

Use descriptive branch names:
- `add-version-X.Y.Z` - Adding new binary version
- `docs/update-installation` - Documentation updates
- `fix/bootstrap-script-bug` - Bug fixes
- `feature/verification-script` - New features

## Binary Submission Process

**IMPORTANT**: Only official XRPLF binaries are accepted.

### Prerequisites

1. Binary must be from an official XRPLF release
2. Must have valid GPG signature from XRPLF key
3. GPG fingerprint: `6D70 4017 0DEA 4F69 DEF5 D569 B6F9 7CF2 1A96 2003`

### Submission Steps

1. **Verify Binary Source**
   ```bash
   # Download from official XRPLF release
   # Verify it matches official checksums
   ```

2. **Verify Signature**
   ```bash
   gpg --import xrplf-binary-packages-public.gpg
   gpg --verify rippled-portable-X.Y.Z.sig rippled-portable-X.Y.Z
   ```

3. **Generate Checksum** (if not provided)
   ```bash
   sha512sum rippled-portable-X.Y.Z > rippled-portable-X.Y.Z.sha512sum
   ```

4. **Add to Repository**
   ```bash
   git checkout -b add-version-X.Y.Z
   cp rippled-portable-X.Y.Z releases/
   cp rippled-portable-X.Y.Z.sig releases/
   cp rippled-portable-X.Y.Z.sha512sum releases/  # if available
   ```

5. **Update Documentation**
   - Update README.md with new version
   - Update any version-specific instructions
   - Add release notes if significant changes

6. **Create Pull Request**
   - Include verification steps in PR description
   - Link to official XRPLF release
   - Provide checksums and signature verification output

### Binary Requirements

- Must be executable (`chmod +x`)
- Must have corresponding `.sig` file
- Should have `.sha512sum` file when available
- Must match official XRPLF release exactly

## Documentation Contributions

### Documentation Standards

- Clear and concise language
- Accurate technical information
- Step-by-step instructions where applicable
- Security warnings where needed
- Examples for complex procedures
- Links to official resources

### Updating Documentation

1. Fork the repository
2. Make your changes
3. Test all instructions
4. Verify links work
5. Check for typos and grammar
6. Submit pull request

### Documentation Checklist

- [ ] Information is accurate
- [ ] Instructions are clear and complete
- [ ] Security considerations included
- [ ] Examples are tested
- [ ] Links are valid
- [ ] No sensitive information exposed

## Testing and Verification

### Before Submitting

1. **Test Installation**
   ```bash
   # Test the installation process
   # Verify all steps work as documented
   ```

2. **Verify Signatures**
   ```bash
   # Re-verify all GPG signatures
   gpg --verify rippled-portable-X.Y.Z.sig rippled-portable-X.Y.Z
   ```

3. **Check Documentation**
   - Follow your own instructions
   - Ensure they work on a fresh system
   - Test on multiple platforms if possible

4. **Review Security**
   - No credentials committed
   - No security regressions
   - Follows security best practices

## Pull Request Process

### Creating a Pull Request

1. **Fork and Clone**
   ```bash
   git clone https://github.com/YOUR_USERNAME/rippled-portable-builds.git
   cd rippled-portable-builds
   ```

2. **Create Branch**
   ```bash
   git checkout -b your-branch-name
   ```

3. **Make Changes**
   - Follow guidelines above
   - Test thoroughly
   - Update documentation

4. **Commit Changes**
   ```bash
   git add .
   git commit -m "Clear, descriptive message"
   ```

5. **Push to GitHub**
   ```bash
   git push origin your-branch-name
   ```

6. **Open Pull Request**
   - Use PR template (if available)
   - Provide detailed description
   - Include testing steps
   - Reference related issues

### Pull Request Template

```markdown
## Description
[Brief description of changes]

## Type of Change
- [ ] Binary addition
- [ ] Documentation update
- [ ] Bug fix
- [ ] New feature
- [ ] Security enhancement

## Verification Steps
1. [Step 1]
2. [Step 2]
...

## Security Checklist
- [ ] GPG signatures verified
- [ ] No sensitive information committed
- [ ] Security policy followed
- [ ] Changes reviewed for security impact

## Testing
[Describe testing performed]

## Additional Notes
[Any additional information]
```

## Review Process

### What Reviewers Check

1. **Security**
   - Valid GPG signatures
   - No security vulnerabilities
   - Follows security policy

2. **Accuracy**
   - Information is correct
   - Links are valid
   - Instructions work as described

3. **Completeness**
   - All required files included
   - Documentation updated
   - Testing performed

4. **Quality**
   - Code follows existing patterns
   - Clear commit messages
   - Proper branch naming

### Review Timeline

- **Initial Review**: Within 3-5 business days
- **Feedback**: Provided as comments on PR
- **Revisions**: Address feedback and update PR
- **Approval**: Requires maintainer approval
- **Merge**: After approval and passing checks

### After Merge

- Your PR will be merged to main branch
- Changes will be available to users
- You'll be credited in commit history
- Consider watching the repo for issues

## Getting Help

### Questions?

- **General Questions**: Open an issue with `question` label
- **Security Questions**: See [SECURITY.md](SECURITY.md)
- **Technical Support**: Check existing issues first
- **Documentation Issues**: Open a documentation issue

### Resources

- [XRPL Documentation](https://xrpl.org/)
- [rippled GitHub](https://github.com/XRPLF/rippled)
- [Security Policy](SECURITY.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)

## Recognition

Contributors are recognized through:
- Git commit history
- Contributors section (if we add one)
- Acknowledgment in release notes for significant contributions

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (MIT License - see LICENSE file).

---

**Thank you for contributing to rippled-portable-builds!** Your efforts help maintain a secure and reliable distribution channel for the XRPL community.

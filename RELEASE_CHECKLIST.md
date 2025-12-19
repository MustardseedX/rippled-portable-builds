# Release Security Checklist

This document provides a comprehensive security checklist for adding new rippled binary releases to this repository. **All items must be verified before merging any binary addition.**

## Pre-Release Verification

### Source Verification
- [ ] Binary obtained from official XRPLF repository
  - Source: https://github.com/XRPLF/rippled/releases
- [ ] Release matches official XRPLF version number
- [ ] Release notes reviewed for security issues
- [ ] No known critical vulnerabilities in this version
- [ ] Version is stable release (not beta/RC unless explicitly intended)

### Binary Integrity
- [ ] Binary file size is reasonable (40-60MB typical)
- [ ] Binary is not corrupted or truncated
- [ ] Binary is complete ELF executable
- [ ] Binary architecture matches intended platform

## Signature Verification

### GPG Signature Checks
- [ ] GPG signature file (.sig) exists
- [ ] GPG public key imported and verified
  - Expected fingerprint: `6D70 4017 0DEA 4F69 DEF5 D569 B6F9 7CF2 1A96 2003`
- [ ] Signature verification passes: `gpg --verify binary.sig binary`
- [ ] Signature is from correct key (XRPLF Binaries <noreply+binary-packages@xrpl.org>)
- [ ] Signature timestamp is reasonable
- [ ] No warnings about key trust issues (except expected warning)

### Checksum Verification
- [ ] SHA-512 checksum file exists (or generated if not provided)
- [ ] Checksum verified against official source
- [ ] Checksum file format is correct
- [ ] Checksum matches when verified locally

## File Security

### Binary Analysis
- [ ] Binary scanned with antivirus (if available)
- [ ] No suspicious strings detected in binary
- [ ] Binary permissions are correct (755 or rwxr-xr-x)
- [ ] Binary owner/group appropriate
- [ ] No setuid/setgid bits set (security risk)

### File Naming
- [ ] Filename follows convention: `rippled-portable-X.Y.Z`
- [ ] Version number matches official release
- [ ] Signature file matches: `rippled-portable-X.Y.Z.sig`
- [ ] Checksum file matches: `rippled-portable-X.Y.Z.sha512sum` (if applicable)
- [ ] No spaces or special characters in filenames

## Repository Security

### Commit Verification
- [ ] Commit message is clear and descriptive
- [ ] Commit includes version number
- [ ] Commit references official release URL
- [ ] No sensitive information in commit message
- [ ] Commit is signed (if repository requires)

### Branch Protection
- [ ] Changes made in feature branch
- [ ] Branch name follows convention
- [ ] No direct commits to main branch
- [ ] Pull request created for review

### Documentation Updates
- [ ] README.md updated with new version
- [ ] Installation instructions reviewed
- [ ] Version table updated if exists
- [ ] Changelog updated with release notes
- [ ] Links to official release included

## Configuration and Scripts

### Bootstrap Script (if modified)
- [ ] Script reviewed for security issues
- [ ] No hardcoded credentials
- [ ] Download URLs point to official sources
- [ ] Error handling is adequate
- [ ] Script follows best practices
- [ ] Comments explain non-obvious sections

### Configuration Files (if modified)
- [ ] No insecure defaults
- [ ] Permissions are appropriate
- [ ] No sensitive information included
- [ ] Documentation explains all settings
- [ ] Follows official rippled configuration guidelines

## Testing

### Functionality Testing
- [ ] Binary downloads successfully
- [ ] Binary is executable
- [ ] Binary runs without immediate errors
- [ ] Version check works: `./binary --version`
- [ ] Help command works: `./binary --help`
- [ ] Signature verification script works (if using verify-binary.sh)

### Platform Testing
- [ ] Tested on intended platform(s)
- [ ] Dependencies documented if any
- [ ] Known limitations documented
- [ ] Compatibility issues noted

### Security Testing
- [ ] Binary doesn't contain obvious backdoors
- [ ] No unexpected network connections on startup
- [ ] Permissions are restrictive enough
- [ ] No unnecessary capabilities required

## Supply Chain Security

### Provenance
- [ ] Clear chain of custody from XRPLF to repository
- [ ] Download source verified (official GitHub release)
- [ ] No intermediate modifications
- [ ] Build reproducibility considered (if applicable)

### Access Control
- [ ] Only authorized maintainers can merge
- [ ] Multiple reviewers for critical changes
- [ ] Branch protection rules enforced
- [ ] Audit log of changes maintained

## Pre-Merge Review

### Peer Review
- [ ] At least one maintainer reviewed
- [ ] Security-focused review completed
- [ ] All checklist items verified by reviewer
- [ ] No unresolved comments or concerns

### Automated Checks
- [ ] CI/CD checks pass (if configured)
- [ ] No merge conflicts
- [ ] No large unexpected files added
- [ ] Git history is clean

## Post-Merge Actions

### Verification
- [ ] Merged changes verified on main branch
- [ ] Binary still verifies after merge
- [ ] Documentation is accessible
- [ ] Links work correctly

### Communication
- [ ] Community notified if significant release
- [ ] Security advisories noted if applicable
- [ ] Known issues documented
- [ ] Support channels prepared for questions

### Monitoring
- [ ] Watch for user reports of issues
- [ ] Monitor for security advisories
- [ ] Track download/usage if possible
- [ ] Be prepared to rollback if critical issue found

## Rollback Plan

In case of critical issues:
- [ ] Rollback procedure documented
- [ ] Previous version still available
- [ ] Can quickly revert changes if needed
- [ ] Communication plan for rollback exists

## Sign-Off

**Release Version:** _____________

**Verified By:**
- Maintainer 1: _____________ Date: _______
- Maintainer 2: _____________ Date: _______

**Security Review:**
- Reviewer: _____________ Date: _______

**Approval:**
- [ ] All checklist items completed
- [ ] Ready for merge
- [ ] Approved by: _____________ Date: _______

---

## Notes

Use this section for any additional notes, exceptions, or special considerations for this release:

_______________________________________________________________________
_______________________________________________________________________
_______________________________________________________________________

---

## Version History

- v1.0.0 (2024-12-19): Initial release checklist
- 

---

**Remember**: When in doubt, delay the release until all concerns are resolved. Security is more important than speed.

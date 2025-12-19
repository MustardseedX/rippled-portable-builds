# Security Policy

## Overview

This repository distributes portable binaries of the rippled server for the XRP Ledger. Security is paramount as these binaries are used in production financial infrastructure. This document outlines our security practices, vulnerability reporting procedures, and binary verification processes.

## Supported Versions

We provide security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 2.1.x   | :white_check_mark: |
| 2.0.x   | :white_check_mark: |
| 1.12.x  | :warning: Limited  |
| < 1.12  | :x:                |

## Binary Verification

### GPG Signature Verification

**CRITICAL**: Always verify GPG signatures before using any binary from this repository.

1. **Import the official GPG key:**
   ```bash
   wget https://raw.githubusercontent.com/XRPLF/rippled-portable-builds/main/xrplf-binary-packages-public.gpg
   gpg --import xrplf-binary-packages-public.gpg
   ```

2. **Verify the GPG fingerprint:**
   ```
   GPG Fingerprint: 6D70 4017 0DEA 4F69 DEF5  D569 B6F9 7CF2 1A96 2003
   ```

3. **Verify binary signature:**
   ```bash
   gpg --verify rippled-portable-<version>.sig rippled-portable-<version>
   ```

4. **Expected output:**
   ```
   gpg: Good signature from "XRPLF Binaries <noreply+binary-packages@xrpl.org>"
   ```

### SHA-512 Checksum Verification

For versions that include SHA-512 checksums:

```bash
sha512sum -c rippled-portable-<version>.sha512sum
```

## Security Considerations

### Supply Chain Security

1. **Binary Provenance**: All binaries in this repository should originate from official XRPLF builds
2. **No Modifications**: Binaries should not be modified after signing
3. **Signature Chain**: Verify complete signature chain before deployment
4. **Source Verification**: Cross-reference with official XRPLF releases

### Deployment Security

1. **Run as Non-Root**: Always run rippled as a dedicated non-privileged user
2. **Firewall Configuration**: Restrict ports according to your use case
3. **File Permissions**: Ensure proper file permissions (see installation guide)
4. **Configuration Validation**: Review rippled.cfg before deployment
5. **Network Isolation**: Consider network segmentation for production validators

### Configuration Security

1. **Validator Keys**: Never commit validator seeds or private keys
2. **API Access**: Restrict admin API access to localhost only
3. **SSL/TLS**: Use proper certificates for production deployments
4. **Logging**: Monitor logs for suspicious activity
5. **Updates**: Keep rippled updated to latest stable version

## Reporting a Vulnerability

### For Security Issues in This Repository

If you discover a security vulnerability in this repository (e.g., compromised binaries, signature issues, malicious code):

1. **DO NOT** open a public issue
2. **DO NOT** discuss publicly until patched
3. **Email**: security@xrplf.org (for XRPLF-related issues)
4. **Include**:
   - Detailed description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### For Issues in rippled Software

For vulnerabilities in the rippled software itself, follow the [XRPLF security policy](https://github.com/XRPLF/rippled/security/policy).

### Response Timeline

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: Varies by severity
  - Critical: 24-72 hours
  - High: 1-2 weeks
  - Medium: 2-4 weeks
  - Low: As scheduled

## Security Best Practices

### For Repository Maintainers

1. **Binary Integrity**:
   - Verify all binaries before adding to repository
   - Sign all binaries with official GPG key
   - Generate and include checksums
   - Document build provenance

2. **Access Control**:
   - Limit commit access to trusted maintainers
   - Require signed commits
   - Enable branch protection
   - Regular access audits

3. **Release Process**:
   - Follow documented release procedures
   - Verify signature before publishing
   - Update CHANGELOG
   - Security review for configuration files

4. **Dependency Management**:
   - Keep bootstrap scripts minimal
   - Pin external dependencies
   - Regular security audits
   - Monitor for CVEs

### For Users

1. **Verification**:
   - Always verify GPG signatures
   - Check SHA-512 checksums when available
   - Verify GPG fingerprint matches documented value
   - Compare with official XRPLF releases

2. **Updates**:
   - Subscribe to security announcements
   - Test updates in non-production first
   - Maintain backup of configuration
   - Document your deployment

3. **Monitoring**:
   - Monitor rippled logs
   - Watch for unusual network activity
   - Track validator list updates
   - Review configuration changes

## Known Security Considerations

### Bootstrap Script (first-run.sh)

The bootstrap script:
- Runs with root privileges (required for system setup)
- Downloads files from GitHub
- Creates system users and directories
- Should only be run on fresh systems
- Review script before execution

**Mitigation**: Read and understand the script before running. Consider manual installation for production systems.

### Binary Distribution

Binaries are:
- Large executable files (40-55MB)
- Statically linked
- Built on specific platforms
- May not work on all systems

**Mitigation**: Always verify signatures and test in non-production first.

## Compliance

This repository aims to comply with:
- Industry best practices for binary distribution
- XRPLF security guidelines
- GPG/PGP signature standards
- Supply chain security principles

## Security Audits

| Audit Type | Last Performed | Next Scheduled |
|------------|---------------|----------------|
| Binary Verification | Per Release | Per Release |
| Script Review | TBD | Quarterly |
| Configuration Review | TBD | Per Release |
| Access Control Audit | TBD | Quarterly |

## Additional Resources

- [XRPL Security Best Practices](https://xrpl.org/security-practices.html)
- [rippled Documentation](https://xrpl.org/install-rippled.html)
- [XRPLF GitHub](https://github.com/XRPLF/rippled)
- [GPG Documentation](https://gnupg.org/documentation/)

## Version History

- 1.0.0 (2024-12-19): Initial security policy

---

**Remember**: Security is everyone's responsibility. When in doubt, verify before trusting.

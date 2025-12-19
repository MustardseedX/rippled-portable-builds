# Quick Start Guide

This guide helps you quickly and safely use rippled portable binaries from this repository.

## ⚡ Quick Installation (3 Steps)

### Step 1: Download Files

```bash
# Download the binary, signature, and verification script
wget https://github.com/XRPLF/rippled-portable-builds/raw/main/releases/rippled-portable-2.1.1
wget https://github.com/XRPLF/rippled-portable-builds/raw/main/releases/rippled-portable-2.1.1.sig
wget https://raw.githubusercontent.com/XRPLF/rippled-portable-builds/main/verify-binary.sh
```

### Step 2: Verify Binary

```bash
# Make verification script executable and run it
chmod +x verify-binary.sh
./verify-binary.sh rippled-portable-2.1.1
```

**IMPORTANT**: Only proceed if verification passes with "✓ PASS" status!

### Step 3: Install

```bash
# Make binary executable
chmod +x rippled-portable-2.1.1

# Install (requires sudo)
sudo mkdir -p /opt/ripple/bin
sudo mv rippled-portable-2.1.1 /opt/ripple/bin/
sudo ln -snf /opt/ripple/bin/rippled-portable-2.1.1 /opt/ripple/bin/rippled
```

**Done!** Test with: `rippled --version`

## 🔒 Security First

### ⚠️ Never Skip These Steps

1. **Always verify GPG signatures** - This protects against tampered binaries
2. **Use official sources only** - Download from XRPLF repositories
3. **Test before production** - Try on a non-production system first

### ✅ Verification Checklist

Before using any binary:
- [ ] Downloaded from official source
- [ ] GPG signature verified
- [ ] Fingerprint matches: `6D70 4017 0DEA 4F69 DEF5 D569 B6F9 7CF2 1A96 2003`
- [ ] SHA-512 checksum verified (if available)
- [ ] Tested in safe environment

## 📚 Full Documentation

For detailed information, see:

- **Security**: [SECURITY.md](SECURITY.md) - Security policies and best practices
- **Installation**: [README.md](README.md) - Complete installation guide
- **Contributing**: [CONTRIBUTING.md](CONTRIBUTING.md) - How to contribute
- **Governance**: [GOVERNANCE.md](GOVERNANCE.md) - Project governance

## 🚀 Fresh System Installation

For brand new systems, use our automated setup script:

```bash
# Download and review the script
wget https://raw.githubusercontent.com/XRPLF/rippled-portable-builds/main/bootstrap/first-run.sh

# Read the script to understand what it does
less first-run.sh

# Run with sudo (only on fresh systems!)
sudo ./first-run.sh
```

**Warning**: Only use `first-run.sh` on systems without existing rippled installations!

## 🔧 Configuration

After installation, configure rippled:

1. **Edit configuration**:
   ```bash
   sudo nano /opt/ripple/etc/rippled.cfg
   ```

2. **Review validators**:
   ```bash
   sudo nano /opt/ripple/etc/validators.txt
   ```

3. **Start rippled**:
   ```bash
   sudo systemctl start rippled
   ```

4. **Check status**:
   ```bash
   rippled server_info
   ```

## 🆘 Getting Help

### Common Issues

**Signature verification fails**:
- Ensure GPG is installed: `sudo apt-get install gnupg`
- Import the official key (verification script does this automatically)
- Check you downloaded from official source

**Binary won't execute**:
- Check permissions: `ls -l rippled-portable-*`
- Make executable: `chmod +x rippled-portable-*`
- Verify platform compatibility

**Server won't start**:
- Check logs: `sudo journalctl -u rippled -f`
- Review configuration: `/opt/ripple/etc/rippled.cfg`
- Ensure ports are available
- Check user permissions

### Support Resources

- **GitHub Issues**: Report bugs and request features
- **Security Issues**: Email security@xrplf.org (do NOT open public issue)
- **XRPL Documentation**: https://xrpl.org/
- **Community Forums**: Check XRPL community channels

## ⚡ Quick Reference

### File Locations

```
/opt/ripple/bin/rippled          # Binary
/opt/ripple/etc/rippled.cfg      # Configuration
/opt/ripple/etc/validators.txt   # Validators
/var/log/rippled/                # Logs
/var/lib/rippled/                # Data
```

### Common Commands

```bash
# Check version
rippled --version

# Server info
rippled server_info

# Start/stop/restart
sudo systemctl start rippled
sudo systemctl stop rippled
sudo systemctl restart rippled

# View logs
sudo journalctl -u rippled -f

# Check status
sudo systemctl status rippled
```

### Verification Commands

```bash
# Verify signature
gpg --verify rippled-portable-X.Y.Z.sig rippled-portable-X.Y.Z

# Check checksum
sha512sum -c rippled-portable-X.Y.Z.sha512sum

# Use verification script
./verify-binary.sh rippled-portable-X.Y.Z
```

## 🛡️ Security Best Practices

1. **Always verify before installing**
2. **Keep system updated**: `sudo apt update && sudo apt upgrade`
3. **Use firewall**: Configure `ufw` or `iptables`
4. **Run as non-root**: Use dedicated rippled user
5. **Monitor logs**: Check for suspicious activity
6. **Regular backups**: Backup configuration and data
7. **Stay informed**: Subscribe to security announcements

## 📋 Pre-Installation Checklist

Before installing rippled:

- [ ] System meets minimum requirements (see documentation)
- [ ] GPG and curl installed
- [ ] Sufficient disk space available
- [ ] Network ports available (51235 for peers)
- [ ] Backups of existing configuration (if updating)
- [ ] Non-production test performed
- [ ] Binary signature verified

## 🔄 Updating

To update to a new version:

1. Download new binary and signature
2. Verify signature
3. Stop rippled: `sudo systemctl stop rippled`
4. Backup configuration
5. Replace binary
6. Start rippled: `sudo systemctl start rippled`
7. Verify: `rippled server_info`

## ⚠️ Important Notes

- **Production Use**: Test thoroughly before production deployment
- **Backups**: Always backup before updates
- **Security**: Never skip signature verification
- **Support**: This is community-maintained; for official support see XRPLF
- **Updates**: Subscribe to releases for security updates

## 📝 Contributing Documentation

Found a gap in the documentation? Want to share your experience?

### Easy Upload Interface

We have an interactive upload helper:

```bash
./upload-document.sh
```

This makes it easy to:
- Add tutorials and guides
- Share configuration examples
- Contribute troubleshooting tips
- Upload platform-specific instructions
- Add images and diagrams

### What to Contribute

- Installation guides for specific platforms
- Common error solutions
- Performance tuning tips
- Deployment examples
- Your real-world experiences

See **[DOCUMENT_UPLOAD_GUIDE.md](DOCUMENT_UPLOAD_GUIDE.md)** for details.

## 📞 Emergency Contacts

**Security Vulnerabilities**: security@xrplf.org  
**Critical Issues**: Open GitHub issue with "critical" label  
**General Questions**: GitHub Discussions or Issues

---

**Last Updated**: 2024-12-19  
**Version**: 1.0.0

For the complete documentation, please see [README.md](README.md) and [SECURITY.md](SECURITY.md).

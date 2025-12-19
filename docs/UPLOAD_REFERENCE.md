# Document Upload Interface - Quick Reference

## 🚀 Three Ways to Upload Documents

### Method 1: Interactive Script (Easiest)

```bash
./upload-document.sh
```

**Features:**
- ✅ Guided menu system
- ✅ Automatic file organization
- ✅ Git integration
- ✅ No technical knowledge required

**Example Session:**
```
What type of document do you want to upload?

1) Tutorial or Guide
2) Example Configuration
3) Troubleshooting Document
4) Platform-Specific Guide
5) Image or Diagram
6) Template File
7) Other Documentation
8) Exit

Select an option (1-8): 1

Enter the path to your file (or drag and drop here): ~/my-tutorial.md
✓ File found: my-tutorial.md

Enter destination filename (press Enter for 'my-tutorial.md'): ubuntu-22-04-guide.md
✓ File copied to: docs/tutorials/ubuntu-22-04-guide.md

Enter a brief description for commit message: Add Ubuntu 22.04 installation guide

Do you want to add this to git? (y/n): y
✓ File staged for commit
```

### Method 2: GitHub Issue Template

1. Go to: [New Issue](https://github.com/XRPLF/rippled-portable-builds/issues/new/choose)
2. Select **"Upload Documentation"**
3. Fill in the form:
   - Choose document type
   - Paste content OR drag-and-drop file
   - Add description
4. Submit issue
5. Maintainer will review and add to repository

**Best for:**
- Non-git users
- Quick contributions
- Community submissions

### Method 3: Manual Upload

**For Git Users:**

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/rippled-portable-builds.git
cd rippled-portable-builds

# Create branch
git checkout -b docs/my-contribution

# Add your file to appropriate directory
cp my-document.md docs/tutorials/

# Commit and push
git add docs/tutorials/my-document.md
git commit -m "docs: Add my tutorial"
git push origin docs/my-contribution

# Create pull request on GitHub
```

**Directory Guide:**
- `docs/tutorials/` → Step-by-step guides
- `docs/examples/` → Configuration examples
- `docs/troubleshooting/` → Problem solutions  
- `docs/platform-guides/` → Platform-specific guides
- `docs/images/` → Images and diagrams
- `docs/templates/` → Configuration templates

## 📋 What Can You Upload?

### High Priority Needs

**Platform Guides:**
- Ubuntu 22.04 / 24.04 installation
- Debian 11 / 12 installation
- Rocky Linux 9 installation
- Fedora installation

**Troubleshooting:**
- Common error messages and fixes
- Network connectivity issues
- Performance problems
- Database synchronization

**Examples:**
- Production configurations
- Test network setups
- Validator configurations
- Resource-constrained systems

**Tutorials:**
- First-time installation
- Upgrading from package manager
- Backup and restore
- Monitoring setup

### Document Types

| Type | Directory | Extension |
|------|-----------|-----------|
| Tutorials | `docs/tutorials/` | `.md` |
| Examples | `docs/examples/` | `.cfg`, `.md` |
| Troubleshooting | `docs/troubleshooting/` | `.md` |
| Platform Guides | `docs/platform-guides/` | `.md` |
| Images | `docs/images/` | `.png`, `.jpg`, `.svg` |
| Templates | `docs/templates/` | `.cfg`, `.sh`, `.service` |

## ✅ Upload Checklist

Before submitting:

- [ ] Document is clearly written
- [ ] Instructions are tested (if applicable)
- [ ] No sensitive information (passwords, keys)
- [ ] Images are optimized (< 1MB)
- [ ] Code examples work
- [ ] Links are valid
- [ ] Security notes included (if needed)

## 🎯 Quick Examples

### Upload a Tutorial

```bash
./upload-document.sh
# Choose option 1 (Tutorial)
# Select your file
# Enter description
# Done!
```

### Upload an Image

```bash
./upload-document.sh
# Choose option 5 (Image)
# Select your image file
# Enter description
# Done!
```

### Upload Configuration Example

```bash
./upload-document.sh
# Choose option 2 (Example Configuration)
# Select your .cfg file
# Enter description
# Done!
```

## 📚 Additional Resources

- **[DOCUMENT_UPLOAD_GUIDE.md](DOCUMENT_UPLOAD_GUIDE.md)** - Complete upload guide
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - General contribution guidelines
- **[docs/README.md](docs/README.md)** - Documentation index

## ❓ Need Help?

- **Questions**: Open an issue with "documentation" label
- **Problems**: Check [DOCUMENT_UPLOAD_GUIDE.md](DOCUMENT_UPLOAD_GUIDE.md)
- **Ideas**: Use "Upload Documentation" issue template

---

**Making documentation contributions easy!** 🎉

No git expertise required - just run the script or use the GitHub issue template.

# Security Escalation Procedures

This document outlines procedures for preserving evidence and escalating repository security and governance concerns for the `MustardseedX/rippled-portable-builds` repository.

## Overview

If you have serious governance or security concerns about this repository, follow the steps below to preserve evidence and escalate through the appropriate channels.

## Quick Report Template (SOS)

Use this two-line message when you need a quick report in a short text box (admin chat, help form, or email):

```
I have serious governance and security concerns about my GitHub repository MustardseedX/rippled-portable-builds and related code.
I need help preserving evidence (PRs, repo state) and escalating this through the appropriate security/compliance channel.
```

## Evidence Preservation Steps

### 1. Keep Your Records Safe

- **Do not delete** any emails or messages you've sent yourself about security concerns
- **Star/flag** important messages in your email client
- **Create a dedicated folder** (e.g., "GitHub-evidence") to organize all security-related communications
- **Move preservation messages** to this folder for easy retrieval

### 2. Document Repository State

When preserving evidence, capture:
- Current state of pull requests (URLs, descriptions, comments)
- Repository configuration and settings
- Code changes or modifications in question
- Timeline of events
- Any relevant workflow logs or artifacts

### 3. Prepare Three Key Items

For escalation with Pro/Enterprise admins or GitHub Support:

1. **One-line summary** about the specific issue (e.g., "Concerns about PR #1")
2. **Long preservation instructions** (detailed evidence and context you've documented)
3. **Escalation template** (formal request for review through security/compliance channels)

## Contacting GitHub Support

### Account Types and Support Access

- **Free accounts**: Use GitHub Community for general questions; contact GitHub Support only for account, security, or abuse issues
- **Paid accounts** (Pro, Team, Enterprise Cloud/Server): Can open support tickets directly for assistance

For detailed information about GitHub Support, see: [About GitHub Support](https://docs.github.com/en/support/learning-about-github-support/about-github-support)

### Private Repository Access

If GitHub Support needs access to a private repository:
- The repository owner will receive an email to accept or decline temporary access
- If accepted, GitHub Support gets access for **five days**
- All GitHub Support actions generate **audit log events** for transparency

For more on temporary access: [Granting GitHub Support temporary access to a private repository](https://docs.github.com/en/support/learning-about-github-support/about-github-support#granting-github-support-temporary-access-to-a-private-repository)

### Opening a Support Ticket

When contacting GitHub Support:

1. **Include clear links** to:
   - Relevant pull requests
   - Issues or discussions
   - Specific commits or code changes
   
2. **Attach redacted logs** (as text files if requested):
   - Workflow logs
   - Error messages
   - System outputs

3. **Reference specific concerns**:
   - Security vulnerabilities
   - Governance violations
   - Compliance issues
   - Evidence of malicious activity

For GitHub Actions-specific support: [Get support for GitHub Actions](https://docs.github.com/en/actions/how-tos/get-support)

## Escalation Process

### Step 1: Initial Contact

Use the **Quick Report Template (SOS)** above to initiate contact with:
- Organization administrators
- GitHub Support
- Repository maintainers

### Step 2: Provide Detailed Context

When they respond, provide your prepared **long preservation instructions** including:
- Detailed timeline of events
- Specific evidence (PR links, commit SHAs, etc.)
- Impact assessment
- Requested actions

### Step 3: Follow Escalation Chain

Depending on the nature of the concern:

1. **Security vulnerabilities**: Follow [GitHub Security Advisories](https://docs.github.com/en/code-security/security-advisories) process
2. **Governance issues**: Contact repository or organization administrators
3. **Terms of Service violations**: Use [GitHub's abuse reporting](https://docs.github.com/en/communities/maintaining-your-safety-on-github/reporting-abuse-or-spam)
4. **Critical incidents**: Engage GitHub Support for paid accounts

## Repository-Specific Context

This repository (`MustardseedX/rippled-portable-builds`) is a fork of the XRPLF rippled portable builds repository. It contains:
- Portable binaries of the rippled server
- GPG signatures for binary verification
- Installation scripts and documentation

### Security Considerations

When reporting concerns about this repository, consider:
- **Binary integrity**: Have binaries been tampered with?
- **Signature verification**: Are GPG signatures valid?
- **Supply chain security**: Have unauthorized changes been introduced?
- **Access controls**: Have permissions been modified inappropriately?

## Additional Resources

- **GitHub Privacy Statement**: [GitHub Privacy Statement](https://docs.github.com/en/site-policy/privacy-policies/github-privacy-statement)
- **GitHub Terms of Service**: [GitHub Terms of Service](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service)
- **Contacting GitHub Support**: [Contacting GitHub Support](https://support.github.com/contact)

## Important Notes

- **Cannot perform actions for you**: This document provides guidance only. You must follow the steps yourself.
- **Keep evidence safe**: Do not delete any documentation or communications related to your concerns.
- **Be specific**: When contacting support, provide exact links, commit SHAs, and clear descriptions.
- **Redact sensitive data**: Remove any credentials, tokens, or personal information before sharing logs or screenshots.

## Choosing the Right Channel

| Situation | Recommended Channel | Message Type |
|-----------|-------------------|--------------|
| Quick report in admin chat | Organization admin | Quick SOS template |
| GitHub Support web form (short) | GitHub Support | Quick SOS template |
| GitHub Support email | GitHub Support | Long preservation block |
| Organization admin email | Organization admin | Long preservation block + escalation template |
| Support ticket with details | GitHub Support | Full documentation package |

---

*This document is based on GitHub Support guidance for preserving evidence and escalating repository security concerns. Always refer to official GitHub documentation for the most current procedures.*

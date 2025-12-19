# Maintainers

This document lists the maintainers of the rippled-portable-builds repository and defines their roles and responsibilities.

## Current Maintainers

### Lead Maintainers

No specific maintainers are currently designated for this fork. For the official repository, please refer to:
- **Official Repository**: https://github.com/XRPLF/rippled-portable-builds
- **XRPLF Organization**: https://github.com/XRPLF

### Areas of Responsibility

| Area | Responsibilities | Contacts |
|------|-----------------|----------|
| Binary Verification | GPG signature validation, checksum verification | TBD |
| Security | Vulnerability response, security reviews | TBD |
| Documentation | README, guides, policy updates | TBD |
| Infrastructure | Repository settings, automation | TBD |

## Becoming a Maintainer

### Qualifications

To become a maintainer, contributors should demonstrate:

1. **Technical Expertise**:
   - Deep understanding of XRPL and rippled
   - Strong knowledge of system security
   - Experience with binary distribution and package management
   - Familiarity with GPG/PGP signing

2. **Community Involvement**:
   - Consistent, high-quality contributions
   - Constructive participation in discussions
   - Support for other contributors
   - Alignment with project values

3. **Security Commitment**:
   - Understanding of security best practices
   - Responsible vulnerability disclosure
   - Adherence to security policies
   - Track record of security-conscious decisions

4. **Time Commitment**:
   - Available for timely PR reviews
   - Responsive to security issues
   - Participation in maintainer discussions
   - Long-term commitment to the project

### Process

1. **Nomination**:
   - Self-nomination or nomination by existing maintainer
   - Submit via GitHub issue with "Maintainer Nomination" label
   - Include qualifications and motivation

2. **Evaluation**:
   - Review of past contributions
   - Assessment of technical skills
   - Community feedback period (2 weeks)
   - Maintainer discussion

3. **Decision**:
   - Consensus among existing maintainers
   - Public announcement
   - Onboarding process

4. **Onboarding**:
   - Repository access granted
   - Review of policies and procedures
   - Mentoring by senior maintainer
   - Gradual increase in responsibilities

## Maintainer Responsibilities

### Core Duties

1. **Pull Request Review**:
   - Review within 3-5 business days
   - Verify security implications
   - Ensure documentation is updated
   - Provide constructive feedback

2. **Binary Verification**:
   - Verify GPG signatures
   - Validate checksums
   - Confirm official XRPLF source
   - Complete security checklist

3. **Security Response**:
   - Monitor security disclosures
   - Respond to vulnerability reports
   - Coordinate incident response
   - Implement security fixes

4. **Community Engagement**:
   - Respond to issues
   - Answer questions
   - Facilitate discussions
   - Welcome new contributors

5. **Policy Enforcement**:
   - Uphold Code of Conduct
   - Enforce security policies
   - Maintain governance standards
   - Report violations

### Review Standards

**For Binary Additions:**
- [ ] Source verified (official XRPLF)
- [ ] GPG signature valid
- [ ] Checksum verified
- [ ] Documentation updated
- [ ] Release checklist completed
- [ ] Multiple maintainer approval

**For Documentation:**
- [ ] Accuracy verified
- [ ] Links tested
- [ ] No security issues
- [ ] Consistent formatting

**For Code/Scripts:**
- [ ] Security review completed
- [ ] No hardcoded secrets
- [ ] Error handling adequate
- [ ] Follows best practices

### Response Times

| Type | Target Response | Target Resolution |
|------|----------------|-------------------|
| Security Critical | < 24 hours | 24-72 hours |
| Security High | < 48 hours | 1-2 weeks |
| Bug Report | < 3 days | Varies |
| Feature Request | < 5 days | Varies |
| Documentation | < 3 days | < 1 week |
| General Question | < 5 days | N/A |

## Maintainer Expectations

### Professional Conduct

- Follow Code of Conduct
- Respectful communication
- Transparent decision-making
- Collaborative approach
- Constructive feedback

### Security Mindset

- Assume binaries could be compromised
- Always verify signatures
- Question unusual changes
- Report concerns promptly
- Prioritize security over convenience

### Communication

- Clear commit messages
- Detailed PR reviews
- Documented decisions
- Timely responses
- Public discussion when appropriate

## Emeritus Maintainers

Maintainers who step down remain valued members of the community:

- Retain contributor access
- Can provide guidance
- May be consulted on major decisions
- Recognized for past contributions

### Current Emeritus Maintainers

None currently listed.

## Decision Making

### Normal Decisions

- Single maintainer approval for minor changes
- Two maintainers for significant changes
- Community feedback considered

### Critical Decisions

- Unanimous approval for:
  - New binary versions
  - Security policy changes
  - GPG key changes
  - Governance updates

### Dispute Resolution

1. Discussion among maintainers
2. Community input if appropriate
3. Vote if consensus not reached
4. Escalation to XRPLF if needed

## Access Levels

### Repository Permissions

| Level | Access | Who |
|-------|--------|-----|
| Admin | Full control | Lead maintainers |
| Write | Merge PRs, manage issues | Active maintainers |
| Triage | Label issues, close duplicates | Trusted contributors |
| Read | View repository | Public |

### Credential Access

- GPG signing keys: Not stored in repository
- Admin accounts: Individual maintainers
- CI/CD secrets: Limited maintainers only

## Maintainer Removal

### Voluntary

- Maintainer requests to step down
- Transition period for handoff
- Move to emeritus status
- Public acknowledgment

### Involuntary

Reasons for removal:
- Violation of Code of Conduct
- Security policy breaches
- Prolonged inactivity (>6 months)
- Loss of community trust

Process:
1. Private discussion with maintainer
2. Opportunity to respond
3. Maintainer vote if unresolved
4. Access revocation if necessary
5. Public notification (if warranted)

## Contact

### For Maintainer Matters

- **General**: GitHub issues
- **Private**: [Maintainer email if configured]
- **Security**: security@xrplf.org

### For Security Issues

Follow the [Security Policy](SECURITY.md):
- Do NOT open public issues
- Email: security@xrplf.org
- Provide detailed information

## Updates to This Document

Changes to this document require:
- Pull request with rationale
- Maintainer review and approval
- Community notification
- Version update

---

## Version History

- **v1.0.0** (2024-12-19): Initial maintainers document

---

**Note**: This is a template for a fork. For the official repository maintainers, please refer to the official XRPLF repository.

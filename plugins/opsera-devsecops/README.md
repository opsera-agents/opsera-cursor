# Opsera DevSecOps Agent

AI-powered DevSecOps analysis for Cursor. Scan your codebase for architectural risks, security vulnerabilities, compliance gaps, and SQL security issues — all from your IDE.

## Features

| Tool | Description |
|------|-------------|
| **Architecture Analysis** | Risk-focused analysis with auth route verification, failure mode detection, and quantified architecture diagrams |
| **Security Scan** | Vulnerability scanning, secret detection, SAST, container security, and IaC checks |
| **Compliance Audit** | Evidence-based auditing for SOC2, HIPAA, PCI-DSS, and ISO 27001 with remediation roadmaps |
| **SQL Security** | SQL injection detection, PII discovery, compliance validation, privilege analysis, and AI-powered auto-fix |

## Quick Start

### Install from Cursor Marketplace

Search for **Opsera DevSecOps Agent** in the Cursor Marketplace and install.

### Authenticate

After installing, authenticate with Opsera via OAuth. Tokens are stored in your system keychain and refresh automatically.

### Usage

Use the slash commands directly:

```
/architecture-analyze    # Analyze architecture risks
/security-scan           # Run security vulnerability scan
/compliance-audit        # Run compliance audit (SOC2, HIPAA, etc.)
/sql-security            # Scan SQL for security issues
```

Or simply describe what you need and the agent will select the right tool:

```
"Scan this repo for security vulnerabilities"
"Are we SOC2 compliant?"
"Check my SQL files for injection risks"
"What are the architectural risks in this codebase?"
```

## Free Trial

This agent includes 4 tools as part of the Opsera free trial. Additional DevSecOps tools will be added in future versions.

## Telemetry

All tool executions report anonymized telemetry to the Opsera analytics dashboard, providing insights on security posture, compliance trends, and remediation progress. No source code is transmitted.

## Requirements

- [Cursor](https://cursor.com) IDE
- An Opsera account (free trial available — sign up at [agent.opsera.ai](https://agent.opsera.ai))

## Support

- Web: [https://agent.opsera.ai](https://agent.opsera.ai)
- Issues: [https://github.com/opsera-agents/opsera-devsecops/issues](https://github.com/opsera-agents/opsera-devsecops/issues)
- Email: support@opsera.io

## License

Apache-2.0

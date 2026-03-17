# Opsera DevSecOps — Cursor Marketplace Plugin

AI-powered DevSecOps analysis for Cursor. Scan your codebase for architectural risks, security vulnerabilities, compliance gaps, and SQL security issues — all from your IDE.

## Plugin

- **opsera-devsecops**: Full-featured DevSecOps agent with architecture analysis, security scanning, compliance auditing, SQL security, pre-commit gates, and MCP integration.

## Features

| Tool | Description |
|------|-------------|
| **Architecture Analysis** | Risk-focused analysis with auth route verification, failure mode detection, and architecture diagrams |
| **Security Scan** | Vulnerability scanning, secret detection, SAST, container security, and IaC checks |
| **Compliance Audit** | Evidence-based auditing for SOC2, HIPAA, PCI-DSS, and ISO 27001 with remediation roadmaps |
| **SQL Security** | SQL injection detection, PII discovery, compliance validation, privilege analysis, and AI-powered auto-fix |
| **Pre-Commit Gate** | Automatic security scan before git commits — blocks only on new critical/high findings in staged changes |

## Getting Started

1. Install the **Opsera DevSecOps Agent** from the Cursor Marketplace.
2. Authenticate with Opsera via OAuth at [agent.opsera.ai](https://agent.opsera.ai).
3. Use slash commands or natural language to invoke tools.

## Plugin Structure

```
plugins/opsera-devsecops/
├── .cursor-plugin/plugin.json   → Plugin manifest
├── mcp.json                     → Opsera MCP server config (HTTP + OAuth)
├── agents/devsecops.md          → Main agent: system prompt, tool routing, telemetry rules
├── skills/*/SKILL.md            → 5 model-invoked skills (auto-triggered by context)
├── commands/*.md                → 4 user-invoked slash commands
├── hooks/hooks.json             → Pre-commit security gate hook config
├── hooks/pre-commit-scan.sh     → Hook script for commit interception
├── rules/devsecops-standards.mdc → DevSecOps coding standards rule
└── assets/logo.svg              → Marketplace logo
```

## Submission Checklist

- Plugin has a valid `.cursor-plugin/plugin.json`.
- Plugin name is lowercase kebab-case.
- `.cursor-plugin/marketplace.json` entries map to real plugin folders.
- All frontmatter metadata is present in rule, skill, agent, and command files.
- Logo is committed and referenced with a relative path.
- `node scripts/validate-template.mjs` passes.

## Free Trial

This agent includes 4 tools as part of the Opsera free trial. Additional DevSecOps tools will be added in future versions.

## Support

- Web: [https://agent.opsera.ai](https://agent.opsera.ai)
- Issues: [https://github.com/opsera-agents/opsera-devsecops/issues](https://github.com/opsera-agents/opsera-devsecops/issues)
- Email: support@opsera.io

## License

Apache-2.0

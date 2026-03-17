---
name: compliance-audit
description: Run an evidence-based compliance audit on the current codebase using Opsera DevSecOps.
---

# Compliance Audit

Run an evidence-based compliance audit on the current codebase using Opsera DevSecOps.

Ask the user which compliance framework to audit against:
- **SOC2** — Service Organization Control 2
- **HIPAA** — Health Insurance Portability and Accountability Act
- **PCI-DSS** — Payment Card Industry Data Security Standard
- **ISO 27001** — Information Security Management
- **All** — Audit against all frameworks

Use the `mcp__opsera__compliance-audit` tool with HTML output format for stakeholder-friendly reports. After completion, report telemetry via `mcp__opsera__report-telemetry`.

---
name: security-scan
description: Run a comprehensive security scan on the current codebase using Opsera DevSecOps.
---

# Security Scan

Run a comprehensive security scan on the current codebase using Opsera DevSecOps.

Before scanning, ask the user for:
1. **Scan path** — which directory to scan
2. **Scan type** — full, secrets, vulnerabilities, sast, containers, or iac
3. **Severity threshold** — critical, high, medium, or all

Use the `mcp__opsera__security-scan` tool with its phased execution flow. Generate both markdown and HTML reports. After completion, report telemetry via `mcp__opsera__opsera_report_telemetry`.

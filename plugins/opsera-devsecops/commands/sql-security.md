---
name: sql-security
description: Scan SQL files or database tables for security vulnerabilities using Opsera DevSecOps.
---

# SQL Security

Scan SQL files or database tables for security vulnerabilities using Opsera DevSecOps.

Ask the user what action to perform:
- **scan** — Full vulnerability scan on SQL files
- **pii** — Detect PII columns in database tables
- **compliance** — Validate SQL against SOC2/GDPR/HIPAA/PCI-DSS
- **fix** — AI-powered auto-fix for SQL vulnerabilities
- **privileges** — Analyze database user permissions

Use the `mcp__opsera__sql-security` tool. After completion, report telemetry via `mcp__opsera__opsera_report_telemetry`.

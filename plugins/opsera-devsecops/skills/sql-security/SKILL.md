---
name: sql-security
description: AI-powered SQL security scanning and auto-fix for Databricks and general SQL. Use when the user asks to scan SQL for injection vulnerabilities, detect PII in databases, validate SQL compliance, analyze database privileges, or auto-fix SQL security issues.
---

# SQL Security

Perform SQL security analysis using the `mcp__opsera__sql-security` tool.

## When to Trigger
- User asks to "scan SQL for security issues" or "SQL security scan"
- User wants to "detect PII" or "find sensitive data" in SQL/databases
- User asks about "SQL injection" vulnerabilities
- User needs SQL compliance validation (SOC2, GDPR, HIPAA, PCI-DSS)
- User wants to "fix SQL security issues" or "auto-fix vulnerabilities"
- User asks to analyze database privileges or permissions

## Execution Steps

1. **Determine the action**: Ask the user what they need:
   - **scan**: Full vulnerability scan on SQL files (requires `sql_file` path)
   - **pii**: Detect PII columns in tables (requires `table` name in catalog.schema.table format)
   - **compliance**: Check SQL against compliance standards (requires `sql_file` and optionally `compliance_standard`)
   - **fix**: AI-powered auto-fix for detected vulnerabilities (requires `sql_file`, sets `auto_fix: true`)
   - **privileges**: Analyze user permissions (requires `table` and/or `user`)
2. **Collect required parameters** based on the action chosen. Do NOT assume paths or table names.
3. **Set severity threshold**: Ask the user their preferred minimum severity (critical, high, medium, low). Default to low for comprehensive results.
4. **Execute the scan**: Call `mcp__opsera__sql-security` with the collected parameters.
5. **Report telemetry**: Call `mcp__opsera__opsera_report_telemetry` with:
   - `toolName`: `sql-security`
   - `status`: success/partial/failed
   - `target`: the SQL file or table analyzed
   - `targetType`: code
   - Finding counts by severity
   - `categories`: type of findings (e.g., "sql_injection,pii,hardcoded_credentials")
6. **Present results**: Summarize vulnerabilities by severity, show specific code locations, and provide remediation guidance.
7. **For auto-fix**: Show proposed fixes for user approval before applying. Never auto-apply fixes without confirmation.

## Important
- ALWAYS report telemetry after scan completion
- NEVER auto-apply fixes without explicit user approval
- For PII detection, clearly flag which columns contain sensitive data and the PII type

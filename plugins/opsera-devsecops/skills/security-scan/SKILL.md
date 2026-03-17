---
name: security-scan
description: Technical security scanning for vulnerabilities, secrets, SAST, container security, and infrastructure-as-code issues. Use when the user asks for vulnerability scanning, secret detection, code security analysis, container scanning, or IaC security checks.
---

# Security Scan

Perform a comprehensive security scan using the `mcp__opsera__security-scan` tool.

## When to Trigger
- User asks to "scan for vulnerabilities", "find secrets", or "security scan"
- User wants SAST analysis, container scanning, or IaC security checks
- User asks "is this code secure?" or "check for security issues"

## Execution Steps

1. **Collect inputs** (Phase 1): Ask the user for any missing required parameters:
   - **path**: Directory or repo to scan (ask if not specified)
   - **scan_type**: full, secrets, vulnerabilities, sast, containers, or iac (ask if not specified)
   - **severity_threshold**: critical, high, medium, or all (ask if not specified)
2. **Verify tools** (Phase 2): Check that required scanning tools are installed. Call with `phase: 2` and `tools_ready` once verified. If tools are missing, help the user install them or note skipped tools.
3. **Execute scans** (Phase 3): Run the actual security scans. Call with `phase: 3`.
4. **Generate reports** (Phase 4): Create markdown and HTML reports with findings. Call with `phase: 4` and `scan_results`.
5. **Report telemetry** (Phase 5): Call `mcp__opsera__opsera_report_telemetry` with:
   - `toolName`: `security-scan`
   - `status`: success/partial/failed
   - `target`: the path scanned
   - `targetType`: repository/container/code
   - Finding counts: `critical`, `high`, `medium`, `low`, `total`
6. **Complete** (Phase 6): Present the summary with critical findings first, remediation steps, and suggested follow-up actions.

## Important
- NEVER assume `tools_ready=true` without actually checking
- NEVER skip asking for missing parameters
- ALWAYS report telemetry after scan completion

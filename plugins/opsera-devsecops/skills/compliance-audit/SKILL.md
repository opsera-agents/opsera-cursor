---
name: compliance-audit
description: Evidence-based compliance auditing for SOC2, HIPAA, PCI-DSS, and ISO 27001 frameworks. Use when the user asks about compliance readiness, audit preparation, control gap analysis, certification requirements, or framework-specific compliance assessments.
---

# Compliance Audit

Perform an evidence-based compliance audit using the `mcp__opsera__compliance-audit` tool.

## When to Trigger
- User asks for "SOC2 audit", "HIPAA compliance", "PCI-DSS assessment", or "ISO 27001 certification"
- User asks "are we compliant?" or "what do we need for [framework]?"
- User needs audit readiness assessment or compliance gap analysis
- User wants to map security controls to compliance frameworks

## Execution Steps

1. **Collect inputs**: Determine the compliance framework and scope:
   - **framework**: soc2, hipaa, pci-dss, iso27001, or all (ask if not specified)
   - **scope**: infrastructure, application, or full (default: full)
   - **output_format**: executive, detailed, audit-ready, or html (recommend html for rich visualization)
   - **evidence_collection**: automated, manual, or hybrid (default: hybrid)
2. **Execute Pass 1** (Compliance Scan): Call `mcp__opsera__compliance-audit` with inputs. Collects evidence, inventories controls, identifies gap signals.
3. **Execute Pass 2** (Control Deep Dive): Continue phased execution with `_execution_id` and `_phase_result`. AI investigates gaps and maps to frameworks.
4. **Execute Pass 3** (Compliance Report): Generate the audit-ready report with scores, findings, and remediation roadmap.
5. **Report telemetry**: Call `mcp__opsera__report-telemetry` with:
   - `toolName`: `compliance-audit`
   - `status`: success/partial/failed
   - `target`: the repository or infrastructure audited
   - `score`: the compliance score (0-100)
   - `scoreLabel`: Elite/High/Medium/Low
   - Finding counts by severity
6. **Present results**: Lead with the compliance score, then critical gaps, then the remediation roadmap. Highlight quick wins vs. long-term fixes.

## Important
- ALWAYS report telemetry after audit completion
- Recommend HTML format for stakeholder-friendly reports
- Suggest follow-up security scan if technical vulnerabilities are found

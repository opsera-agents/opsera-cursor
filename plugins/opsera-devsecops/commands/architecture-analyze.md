---
name: architecture-analyze
description: Perform a risk-focused architecture analysis on the current codebase using Opsera DevSecOps.
---

# Architecture Analysis

Perform a risk-focused architecture analysis on the current codebase using Opsera DevSecOps.

Analyze the repository for:
- Architectural risks and anti-patterns
- Auth route verification — every route checked for correct middleware
- Failure mode analysis — what breaks when components fail
- Single points of failure and scalability bottlenecks
- Hard-to-reverse architectural decisions and technical debt

Use the `mcp__opsera__architecture-analyze` tool. Generate an HTML report for rich visualization. After completion, report telemetry via `mcp__opsera__report-telemetry`.

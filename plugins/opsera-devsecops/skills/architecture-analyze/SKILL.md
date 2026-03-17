---
name: architecture-analyze
description: Risk-focused architecture analysis that unearths deep insights specific to the codebase. Use when the user asks to analyze architecture, find architectural risks, review system design, verify auth routes, analyze failure modes, generate architecture diagrams, or understand tech stack trade-offs.
---

# Architecture Analysis

Perform a risk-focused architecture analysis using the `mcp__opsera__architecture-analyze` tool.

## When to Trigger
- User asks to "analyze architecture", "find architectural risks", or "review system design"
- User wants auth route verification or failure mode analysis
- User asks about tech stack, security gaps, or single points of failure
- User wants architecture diagrams with quantified metrics

## Execution Steps

1. **Collect context**: Gather the repository path, project name, and any known concerns from the user. If not provided, use the current working directory.
2. **Pre-scan**: Run `find . -type f | head -500` to collect a file listing and read key files (README, package.json, etc.) for repo context.
3. **Execute Pass 1** (Fast Scan): Call `mcp__opsera__architecture-analyze` with the collected context. This returns an `_execution_id` for continuation.
4. **Execute Pass 2** (Risk Deep Dive): Continue the phased execution by passing the `_execution_id` and `_phase_result` from Pass 1.
5. **Execute Pass 3** (Risk Report): Complete the analysis by passing results from Pass 2. Request HTML format for rich visualization.
6. **Report telemetry**: Call `mcp__opsera__report-telemetry` with:
   - `toolName`: `architecture-analyze`
   - `status`: success/partial/failed
   - `target`: the repository analyzed
   - Any scores or finding counts from the report
7. **Present results**: Summarize the key risks, architectural decisions, and failure modes. Highlight actionable items.
8. **Suggest follow-ups**: Recommend security scan on high-risk components or compliance audit if governance gaps found.

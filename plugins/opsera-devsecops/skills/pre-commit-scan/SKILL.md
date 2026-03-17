---
name: pre-commit-scan
description: Automatic security scan triggered before git commits. Runs the Opsera security scan tool against the entire repo, categorizes findings into new (staged) vs existing, and blocks commits only if staged changes have critical/high issues.
---

# Pre-Commit Security Scan

Run the Opsera security scan tool before allowing a git commit. Findings are categorized into new (from staged changes) and existing (from pre-existing code) to make gate decisions.

## When to Trigger
- A git commit was blocked by the Opsera security gate hook
- User explicitly asks for a pre-commit security check
- Message contains "OPSERA SECURITY GATE" or "pre-commit scan"

## Execution Steps

1. **Identify changed lines**: Run `git diff --cached` (full diff with line numbers) to determine exactly which lines were added or modified. Also run `git diff --cached --name-only` to get the list of staged files.
2. **Run the Opsera security scan tool**: Call `mcp__opsera__security-scan` with:
   - `scan_type`: `pre-commit`
   - `path`: the repository root (scan the ENTIRE repo, not just staged files)
   - `severity_threshold`: `high` (block on high/critical only)
3. **Categorize findings**:
   - **NEW findings**: Issues in staged files whose reported line numbers fall within the added/modified lines of the diff (i.e., lines the user actually changed). Use the diff hunks to determine this.
   - **EXISTING findings**: ALL other issues — including issues in staged files on lines the user did NOT change, as well as issues in non-staged files. These are pre-existing.
4. **Gate decision**:
   - If there are **Critical or High NEW findings** (on lines the user actually added/modified): BLOCK the commit. Present findings with remediation steps. Ask the user whether to fix issues or force-commit.
   - If there are **NO Critical/High NEW findings**: ALLOW the commit.
     - If there are Critical/High EXISTING findings (in non-staged files or on unchanged lines in staged files), display a **warning message** summarizing them, but still proceed with the commit.
5. **Clear the gate** (when allowed): Create the flag file `/tmp/.opsera-pre-commit-scan-passed` so the hook allows the commit through.
6. **Report telemetry**: Call `mcp__opsera__report-telemetry` with:
   - `toolName`: `pre-commit-scan`
   - `status`: success/failed
   - `target`: repository path
   - `targetType`: `commit`
   - Finding counts: `critical`, `high`, `medium`, `low`, `total`
7. **Retry or report**:
   - On pass: Inform the user the gate is cleared and automatically retry the original `git commit` command.
   - On fail: Present findings with remediation steps. Ask user if they want to fix or force-commit.

## Critical Rules
- **ALWAYS run the actual Opsera security scan tool** — DO NOT perform a manual code review as a substitute
- **DO NOT skip the scan** or declare findings based on your own analysis of the code
- The scan runs against the entire repo; the categorization into new vs existing happens AFTER the scan based on the staged files list
- ALWAYS report telemetry after scan completion
- The gate flag expires after 5 minutes — if the user delays, the scan runs again
- If the user says "skip scan" or "force commit", clear the gate and allow the commit

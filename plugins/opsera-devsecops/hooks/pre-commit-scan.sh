#!/bin/bash
# Opsera DevSecOps Pre-Commit Security Gate
# This hook intercepts git commit commands and requires a security scan first.
# It runs as a Cursor beforeShellExecution hook on git commit commands.

input=$(cat)
command=$(echo "$input" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('command','') or d.get('command',''))" 2>/dev/null)

if ! echo "$command" | grep -qE 'git\s+commit'; then
  exit 0
fi

scan_flag="/tmp/.opsera-pre-commit-scan-passed"
if [ -f "$scan_flag" ]; then
  if [ "$(uname)" = "Darwin" ]; then
    age=$(( $(date +%s) - $(stat -f %m "$scan_flag") ))
  else
    age=$(( $(date +%s) - $(stat -c %Y "$scan_flag") ))
  fi
  if [ "$age" -lt 300 ]; then
    rm -f "$scan_flag"
    echo "Opsera security scan passed. Proceeding with commit."
    exit 0
  fi
  rm -f "$scan_flag"
fi

cat <<'MSG' >&2
OPSERA SECURITY GATE: A security scan is required before committing.

MANDATORY INSTRUCTIONS — Follow these steps exactly. DO NOT skip or substitute any step.

1. RUN THE OPSERA SECURITY SCAN TOOL:
   - Call the `mcp__opsera__security-scan` tool with scan_type="pre-commit".
   - The scan MUST run against the ENTIRE repository (pass the repo root as the path).
   - DO NOT perform a manual code review instead of running the tool. A manual review is NOT a substitute for the automated scan.
   - DO NOT skip the scan or declare findings based on your own analysis.

2. CATEGORIZE THE RESULTS:
   - Run `git diff --cached` (full diff with line numbers) to determine exactly which lines were added or modified.
   - Run `git diff --cached --name-only` to get the list of staged files.
   - Separate scan findings into two categories:
     a) NEW findings: Issues in staged files whose reported line numbers fall within the added/modified
        lines of the diff (i.e., lines the user actually changed). Use the diff hunks to determine this.
     b) EXISTING findings: ALL other issues — including issues in staged files that are on lines the
        user did NOT change, as well as issues in non-staged files. These are pre-existing.

3. GATE DECISION:
   - BLOCK the commit (DO NOT clear the gate) if there are any Critical or High severity NEW findings
     (i.e., on lines the user actually added/modified in the staged diff).
     Present the findings with remediation steps and ask the user how to proceed.
   - ALLOW the commit (clear the gate) if there are NO Critical/High NEW findings.
     If there are Critical/High EXISTING findings (in non-staged files or on unchanged lines in staged files),
     display a warning message summarizing them, but still clear the gate and proceed with the commit.

4. CLEAR THE GATE (when allowed):
   - Create the flag file: `touch /tmp/.opsera-pre-commit-scan-passed`
   - Then automatically retry the original `git commit` command.

5. REPORT TELEMETRY:
   - Call `mcp__opsera__report-telemetry` with toolName="pre-commit-scan",
     the finding counts, and status="success" or "failed".
MSG
exit 2

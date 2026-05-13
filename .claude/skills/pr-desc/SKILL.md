---
name: pr-desc
description: Generate a concise PR description (max 5 bullets) from the current branch's changes vs the base branch (usually main), then copy it to the clipboard. Use this skill whenever the user asks for a PR description, PR summary, PR bullets, or wants to copy changes to the clipboard for a pull request. Trigger on phrases like "make me a PR description", "PR desc", "summarize this PR", "copy PR description".
---

## Workflow

1. Identify the base branch (default: `main`; use `master` or another if the repo calls for it).

2. Gather context:
   ```bash
   git log main..HEAD --oneline
   git diff main...HEAD --stat
   git diff main...HEAD
   ```

3. Write at most **5 bullets**. Each bullet:
   - Starts with `- **Short title**: `
   - Explains *why* the change matters or what problem it solves — not just what changed
   - Is one sentence (two if genuinely needed for clarity)
   - Omits boilerplate ("Updated files", "Made changes to X")

4. Copy to clipboard using Python so the shell redirect operator doesn't interfere with permissions:
   ```python
   python3 -c "
   import subprocess
   text = '''<the bullets>'''
   p = subprocess.Popen(['pbcopy'], stdin=subprocess.PIPE)
   p.communicate(text.encode())
   "
   ```

5. Output the bullets in the chat AND confirm they've been copied.

## Style

- Lead with the most impactful change
- Group related changes into a single bullet rather than listing files
- Prefer concrete nouns over vague verbs ("Removed X" beats "Updated code to no longer use X")
- Never mention file names unless the file name *is* the concept (e.g., `CLAUDE.md`)
---
name: handoff
description: Use when approaching message 10, before running /clear, or when switching context mid-session — generates a structured session summary to paste into a new chat
---

# Handoff

## Overview

Produces a dense, paste-ready session summary. No fluff. Designed for solo operators who context-switch often and can't afford to re-explain their last hour of work.

## Output Format

Generate this exact structure when invoked:

---

### SESSION HANDOFF — [date]

**BUILT / DECIDED**
- [concrete thing completed or decided, one line each]

**PENDING** _(priority order)_
- [ ] [task] — [why it matters]
- [ ] ...

**TECHNICAL DECISIONS**
- [decision]: [rationale in ≤10 words]
- ...

**PROJECT STATE**
| Project | Status | Blocker |
|---------|--------|---------|
| [name] | [phrase] | [or —] |

**EXACT NEXT ACTION**
→ [one line: what to do first in the next session]

---

## When to Use

- Session is approaching message 10
- You're about to run `/clear`
- You're switching machines, tools, or collaborators
- You feel lost and want to orient fast

## Behavior Rules

- **Scan the full conversation** — don't summarize only the last few messages
- **Be surgical** — one line per item, no elaboration unless critical
- **Pending items are priority-ordered** — highest urgency first
- **Project state is current state** — not aspirational, not historical
- **Next action is singular and executable** — not "continue working on X", but "run `npm test` in /project" or "open Logic session `mix_v3`"
- Skip sections that have no content rather than writing "N/A"

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Vague next action ("keep working on the bot") | Make it a command, filename, or specific step |
| Pending list is unordered | Always sort by urgency |
| Project state has 5-word statuses | Use 2–3 words max: "in progress", "blocked", "shipped" |
| Technical decisions listed without rationale | Even 5 words of context is enough |
| Summarizing only recent messages | Read from the top — decisions made early still count |

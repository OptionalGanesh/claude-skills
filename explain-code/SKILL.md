---
name: explain-code
description: Explains code with visual diagrams and analogies. Use when explaining how code works, teaching about a codebase, or when the user asks "how does this work?" or wants to understand a piece of code.
---

# Explain Code

When explaining how code works, always include all four of these elements:

## 1. Analogy

Start with an analogy that compares the code to something from everyday life. Make it concrete and relatable. The goal is to give the reader an intuitive mental model before diving into details.

## 2. Diagram

Draw a diagram using ASCII art to show the flow, structure, or relationships. Examples:

```
Input → [Step A] → [Step B] → Output
              ↓
         [Side Effect]
```

Use boxes, arrows, and labels. Show data flow, call stacks, state changes, or component relationships as appropriate.

## 3. Step-by-Step Walkthrough

Walk through the code explaining what happens at each step. Be specific about:
- What data looks like at each point
- Why each step exists (not just what it does)
- How the pieces connect together

## 4. Gotcha

Highlight one common mistake or misconception about this code. What trips people up? What assumption is wrong? What edge case breaks it?

---

**Format:** Use headers and code blocks. Keep analogies short (2-3 sentences). Diagrams should fit in 80 chars width. Be concise — clarity over completeness.

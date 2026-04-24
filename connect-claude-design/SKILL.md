---
name: connect-claude-design
description: Use when translating design files, mockups, or design specs into code. Covers reading Figma designs, extracting design tokens, implementing components that match a visual spec, and maintaining design-code fidelity across iterations.
---

# Connect with Claude Design

Bridge the gap between design specifications and implementation.

## Overview

**Core principle:** Never write UI code without first understanding the design intent. A pixel-perfect implementation of the wrong thing is still wrong.

## When to Use

- User shares a Figma link, screenshot, or design spec
- Building UI components that must match a visual design
- Extracting design tokens (colors, typography, spacing) from a design system
- Checking whether implemented UI matches a design mockup
- Iterating on UI to close gaps between design and code

## The Process

### Step 1: Understand the Design

Before writing any code, extract these from the spec:

**Layout**
- Component boundaries and nesting
- Spacing values (margin, padding, gap)
- Alignment and distribution rules
- Responsive breakpoints if shown

**Visual style**
- Color values (hex, rgba, or design token names)
- Typography (font family, size, weight, line height)
- Border radius, shadows, borders
- States: hover, active, disabled, error

**Behavior**
- Interactive elements and what they do
- Transitions or animations shown
- Loading and empty states
- Error states

### Step 2: Map to Tokens

Prefer design tokens over raw values. If the project has a design system:

```bash
# Find existing tokens
grep -r "color\|spacing\|font\|radius" src/tokens/ src/styles/ src/theme/
```

If a design value matches an existing token, use the token — never hardcode a value that's already defined.

When no token exists for a new value, define one rather than hardcoding:

```ts
// ❌ Bad
color: '#6B7280'

// ✅ Good
color: colors.gray[500]
```

### Step 3: Implement Top-Down

Build from the outermost container inward:

1. Outer layout and spacing
2. Major sections
3. Individual components
4. Typography and icons
5. States (hover, focus, error)

This reveals structural mismatches early, before fine-grained details are invested.

### Step 4: Verify Against Design

After implementing each component, compare systematically:

```
For each element in the design:
  ✓ Dimensions and spacing match (within ~2px tolerance)
  ✓ Colors use correct tokens or values
  ✓ Typography matches (size, weight, line height)
  ✓ Interactive states are covered
  ✓ Responsive behavior follows breakpoints
```

**Use browser DevTools** to inspect computed styles against spec values. Don't rely on eyeballing.

### Step 5: Iterate Precisely

When gaps exist between implementation and design:

- Identify the specific property that differs
- Trace where it should come from (token, inline style, CSS class)
- Fix the source, not symptoms (don't add compensating margins)

## Working with Figma

When given a Figma link or exported spec:

| Design element | How to extract |
|----------------|---------------|
| Colors | Inspect panel → fill color → copy hex |
| Spacing | Select element → inspect → margin/padding values |
| Typography | Select text → inspect → font properties |
| Component variants | Check component panel for state variations |
| Auto-layout | Maps directly to CSS flexbox/grid |

Figma's auto-layout properties map directly:

| Figma | CSS |
|-------|-----|
| Direction: Horizontal | `flex-direction: row` |
| Direction: Vertical | `flex-direction: column` |
| Gap | `gap` |
| Padding | `padding` |
| Alignment | `align-items` / `justify-content` |
| Fill container | `flex: 1` |
| Hug contents | `width: fit-content` |

## Common Mistakes

**Hardcoding instead of using tokens**
Design values almost always exist in a design system. Check first.

**Building inner components before layout**
Get the container structure right first. Inner details are wasted effort if the layout is wrong.

**Skipping states**
Designs often show only the default state. Ask about or infer: hover, focus, disabled, loading, empty, error.

**Ignoring line height**
Typography that looks right in font size can still have wrong rhythm. Line height matters.

**Pixel-hunting without checking breakpoints**
A component that matches at 1440px may break at 375px. Verify both.

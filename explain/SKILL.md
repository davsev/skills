---
name: explain
description: Called explicitly via "/explain <url>". Accepts a GitHub PR URL or any document URL and produces a rich, self-contained, RTL Hebrew HTML page with visual diagrams, file change cards, code snippets, commit timeline, and alert/success boxes. Output is always a single HTML code block — never written to disk.
disable-model-invocation: true
---

# Explain

Produces a self-contained, dark-themed HTML page that explains a GitHub PR or document in Hebrew with full RTL support.

## How to invoke

```
/explain https://github.com/org/repo/pull/123
/explain https://any-document-url
```

Output is always a **single HTML code block** in the chat — never written to disk. Paste it into a browser or save it as a `.html` file to view.

## Workflow

1. **Fetch the content** — fetch the URL or read an uploaded diff/document file the user attached.
2. **Identify the key information** — for PRs: files modified, lines added/removed, commit messages, review comments. For documents: sections, key points, structure.
3. **Build the HTML** — use the template below. Always include what is relevant to the content type:
   - Header with title, author, date, source link
   - Purpose/summary section in plain Hebrew
   - Visual comparison (before/after, version bumps, icon changes) — if applicable
   - Flow diagram showing sequence of events — if applicable
   - File change cards (one per logical file group) — for PRs
   - Code snippets for the most important diffs — for PRs
   - Commit timeline — for PRs
   - Alert/success boxes for any issues raised and their resolutions
   - Related links section if mentioned

## HTML Template Structure

```html
<!DOCTYPE html>
<html lang="he" dir="rtl">
<head>
  <meta charset="UTF-8">
  <!-- dark GitHub-style theme, RTL, Segoe UI font -->
</head>
<body>
  <!-- 1. Header: badge/status, title, meta (author · date · source) -->
  <!-- 2. Purpose section: one-paragraph plain Hebrew -->
  <!-- 3. Visual comparison (before/after / version bump) — if relevant -->
  <!-- 4. Flow diagram: flex row of numbered steps — if relevant -->
  <!-- 5. Content cards: 2-col grid -->
  <!-- 6. Code snippets: .code-block with .add/.rem/.ctx spans — if relevant -->
  <!-- 7. Timeline / commit list — if relevant -->
  <!-- 8. Alert/success boxes for issues and fixes -->
  <!-- 9. Related links -->
</body>
</html>
```

## Style Constants

| Token       | Value                        |
|-------------|------------------------------|
| background  | `#0d1117`                    |
| card bg     | `#161b22`                    |
| border      | `#30363d`                    |
| added       | `#3fb950`                    |
| removed     | `#f85149`                    |
| link/accent | `#58a6ff`                    |
| muted text  | `#8b949e`                    |
| warn bg     | `#3d1f00` / border `#d29922` |
| ok bg       | `#0f2a1a` / border `#238636` |

## Rules

- All prose is in **Hebrew**, `dir="rtl"`.
- Code identifiers and technical names stay in Latin (`monospace`).
- SVG icons are inline — no external image dependencies.
- Fully self-contained — no CDN links.
- Show version bump visuals (old → new) when a version constant changes.
- If a review comment or issue was raised, always show it as a `warn` box followed by an `ok` box for the fix.

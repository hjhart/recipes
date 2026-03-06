---
name: import-recipe
description: Import a recipe from a URL into the recipes collection as a .cook file
argument-hint: <url> [image-url]
---

# Import Recipe

Import a recipe from a URL into this recipes repository.

## Arguments

- `$ARGUMENTS` — the source URL, optionally followed by an image URL (e.g. `https://example.com/recipe https://example.com/image.jpg`). Derive the slug from the recipe title in kebab-case.

## Steps

1. **Fetch** the recipe using the FlareSolverr proxy at `http://media.hjhart.com:8191/` — it's always available and bypasses Cloudflare/bot protection. Use Bash with curl:

   ```bash
   curl -s -X POST "http://media.hjhart.com:8191/v1" \
     -H "Content-Type: application/json" \
     -d '{"cmd":"request.get","url":"<RECIPE_URL>","maxTimeout":60000}' > /tmp/recipe_fetch.json
   ```

   Then parse the HTML from `.solution.response` using a Python one-liner to extract: title, author, servings, prep/cook time, tags, ingredients (with quantities and units), and step-by-step instructions. Look for structured data (`application/ld+json` with `@type: Recipe`) first — it's the most reliable source. Fall back to parsing HTML if structured data is absent.

2. **Convert to Cooklang** following the conventions in CLAUDE.md:
   - Prose paragraph steps (no numbered lists or section headers)
   - Inline ingredients: `@ingredient name{quantity%unit}` — use exact names and quantities from the source
   - Cookware: `#item{}`
   - Timers: `~{duration%unit}`

3. **Write** the file to `recipes/<slug>.cook` with YAML frontmatter (title, author, source, tags, servings, cook time).

4. **Image** — if an image URL was provided as an argument, download it immediately to `recipes/<slug>.<ext>` using the correct extension based on the URL or detected file type. Otherwise ask the user if they have an image URL. If they don't, offer to generate one with DALL-E 3 (adds `ai_image: true` to frontmatter).

5. **Show** the finished `.cook` file contents and ask the user to review before doing anything else.

6. After approval, ask whether to commit and push.

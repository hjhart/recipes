---
name: import-recipe
description: Import a recipe from a URL into the recipes collection as a .cook file
argument-hint: <url> [slug] [image-url]
---

# Import Recipe

Import a recipe from a URL into this recipes repository.

## Arguments

- `$ARGUMENTS` — the source URL, optionally followed by a slug and/or an image URL (e.g. `https://example.com/recipe my-slug https://example.com/image.jpg`). If no slug is provided, derive one from the recipe title in kebab-case.

## Steps

1. **Fetch** the recipe from the URL using WebFetch. Extract: title, author, servings, prep/cook time, tags, ingredients (with quantities and units), and step-by-step instructions.

2. **Convert to Cooklang** following the conventions in CLAUDE.md:
   - Prose paragraph steps (no numbered lists or section headers)
   - Inline ingredients: `@ingredient name{quantity%unit}` — use exact names and quantities from the source
   - Cookware: `#item{}`
   - Timers: `~{duration%unit}`

3. **Write** the file to `recipes/<slug>.cook` with YAML frontmatter (title, author, source, tags, servings, cook time).

4. **Image** — if an image URL was provided as an argument, download it immediately to `recipes/<slug>.<ext>` using the correct extension based on the URL or detected file type. Otherwise ask the user if they have an image URL. If they don't, offer to generate one with DALL-E 3 (adds `ai_image: true` to frontmatter).

5. **Show** the finished `.cook` file contents and ask the user to review before doing anything else.

6. After approval, ask whether to commit and push.

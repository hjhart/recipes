# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal recipe collection using [Cooklang](https://cooklang.org/) — a plaintext recipe markup language. Recipes are stored as `.cook` files in `recipes/`, and a static HTML site is generated into `docs/` for deployment to GitHub Pages.

## Dependencies

- **CookCLI** (`cook`) — the Cooklang CLI tool, must be installed separately
- **Ruby + Bundler** — for build and import scripts (`bundle install` to install gems)

## Common Commands

### Import a recipe from a URL
```
ruby scripts/import.rb "https://example.com/recipe-url" recipe-name
```
This runs `cook import`, adds the source URL to frontmatter, and writes `recipes/recipe-name.cook`.

If `cook import` fails to parse a site, try prefixing the URL with `cook.md/` or use the cookifies tool at `https://cook.md/cookifies/new`.

### Build the static site
```
./scripts/build-site.rb
```
Generates `docs/` from `recipes/*.cook` files and HTML templates in `templates/`.

### Preview locally
```
cd docs && python3 -m http.server 8000
```

### Cooklang CLI utilities
```
cook server              # Run local recipe server
cook search <term>       # Search recipes
cook shopping-list <file>.cook   # Generate ingredient list
```

## Architecture

### Recipe Format
`.cook` files use YAML frontmatter (between `---` delimiters) followed by Cooklang-formatted steps. Common frontmatter fields: `title`, `author`, `source`, `tags`, `servings`, `time required`, `cook time`, `image`.

Cooklang syntax: `@ingredient{quantity%unit}`, `#cookware{}`, `~{time%unit}`.

### Build Pipeline (`scripts/build-site.rb`)
1. Cleans and recreates `docs/`
2. For each `.cook` file: runs `cook report --template templates/recipe.html` to generate `docs/recipes/<name>.html`
3. Runs `cook recipe <file> --format json` to extract metadata for the index
4. Renders `templates/index.html` into `docs/index.html` by replacing Jinja2-style `{% for %}...{% endfor %}` blocks with generated recipe card HTML

### Templates (`templates/`)
- `recipe.html` — Jinja2 template processed by CookCLI's `cook report` command; has access to `metadata`, `ingredients`, `cookware`, and `sections` variables
- `index.html` — static HTML with a `{% for recipe_info in recipes %}...{% endfor %}` block replaced by the Ruby build script
- `styles.css` — copied verbatim to `docs/styles.css`

### Deployment
Pushing to `main` triggers a GitHub Actions workflow (`.github/workflows/deploy.yml`) that installs Ruby + CookCLI, runs `build-site.rb`, and deploys `docs/` to GitHub Pages.

## Importing a Recipe

**Important:** Never invent or reconstruct recipe content from memory. All ingredients and steps must come directly from the source URL. If the source URL cannot be fetched, skip the recipe entirely.

### Steps to import a recipe

1. Fetch the source URL to extract: title, source URL, tags, time, servings, author, notes, ingredients, and steps.
2. Convert the recipe body to **Cooklang format**:
   - Keep all ingredient names, quantities, and step wording exactly as written — do not paraphrase or change any wording.
   - Write each step as a prose paragraph (not a numbered list).
   - Mark ingredients inline using `@ingredient name{quantity%unit}` syntax. Use the exact name and quantity from the ingredient list. If a quantity has no unit (e.g. "2 eggs"), write `@eggs{2}`.
   - Mark cookware with `#item{}` (e.g. `#pressure cooker{}`).
   - Mark timers with `~{duration%unit}` (e.g. `~{15%minutes}`).
   - Do NOT include a separate "Ingredients" or "Directions" section header — ingredients are embedded inline in the steps.
   - Example: `Add @olive oil{2%tbsp} to a #skillet{} and heat over medium for ~{2%minutes}.`
3. Write frontmatter with: `title`, `source`, `tags` (comma-separated lowercase), `cook time`, `servings`, `author`, `notes` (as applicable).
4. Find or generate an image:
   - **First**, check if the source page has an image URL and download it to `recipes/<slug>.jpg`.
   - **If no image can be found**, generate one using DALL-E 3 via the `scripts/generate-images.rb` script pattern: call the OpenAI images API (key is in `.env` as `OPENAI_API_KEY`) with a prompt like `"Professional food photography. [dish description]. Appetizing, high quality, natural lighting."`, save the result to `recipes/<slug>.jpg`, and add `ai_image: true` to the recipe's frontmatter.
   - Do NOT add an `image` field to the frontmatter — the build script auto-detects local images by matching `recipes/<slug>.<ext>` and copies them to `docs/`.
   - The `ai_image: true` frontmatter flag causes a "✨ AI image" badge to appear on the card and recipe page.
5. Always include `servings` when it can be determined.
6. Name the output file `recipes/<kebab-case-title>.cook`.
7. Show the user the result and ask for review before finalizing.

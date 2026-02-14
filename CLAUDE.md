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

## Importing from Notion Export

Recipes are stored in Notion and can be bulk-exported. The export lives at `notion-export/` (gitignored).

### Export format
Each recipe is a Markdown file at `notion-export/Recipes/<Recipe Title> <uuid>.md`. Images may be in a matching subdirectory `notion-export/Recipes/<Recipe Title>/`.

The Markdown frontmatter properties to map to `.cook` frontmatter:
| Notion field | `.cook` frontmatter key |
|---|---|
| (page title) | `title` |
| `URL` | `source` |
| `Tags` | `tags` (comma-separated, lowercase) |
| `Time` | `cook time` or `time required` |
| `Notes` | `notes` |
| Author (from source page) | `author` |
| Yield / servings (from ingredients) | `servings` |

### Steps to import a recipe from Notion export

1. Find the `.md` file in `notion-export/Recipes/` by recipe name.
2. Read the Notion Markdown to extract: title, source URL, tags, time, servings, author, notes, ingredients, and steps.
3. Convert ingredients and steps to Cooklang format:
   - Inline ingredients as `@name{quantity%unit}` — e.g. `@sushi rice{1.5%cups}`
   - Cookware as `#item{}`
   - Timers as `~{duration%unit}`
4. Write frontmatter using the field mapping above. Always include `title`. Use `tags` as a comma-separated lowercase string.
5. If the recipe has an image:
   - Prefer the local image from the Notion export subdirectory (copy it to `recipes/<slug>.jpg` or `.png`)
   - Otherwise, download the image URL found in the Notion Markdown (`![](url)`) and save to `recipes/<slug>.jpg`
   - Do NOT add an `image` field to the frontmatter (the build script does not yet copy local images to `docs/`)
6. Always include `servings` when it can be determined — check the Notion page, and if not listed there, fetch the source URL to find yield/servings.
7. Name the output file `recipes/<kebab-case-title>.cook`.
7. Show the user the result and ask for review before finalizing.

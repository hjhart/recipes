# James' Recipes!

These recipes are formatted as cooklang recipes.

They are hosted on [github pages](https://hjhart.github.io/recipes/)

If you'd like to view them, check out how to do that on their webpage.

### How to import a recipe

Use the `/import-recipe` Claude skill inside Claude Code:

```
cd ~/workspace/recipes
claude 
/import-recipe <url>
/import-recipe <url> <image-url>
```

Claude will fetch the recipe, convert it to Cooklang format, handle the image, show you the result for review, then offer to commit and push.

If Claude can't parse the site automatically, try prefixing the URL with `cook.md/` or use the cookifies tool at https://cook.md/cookifies/new.

### Ingredients

`cook shopping-list potato-leek-gratin.cook`

### Run a server showing all of the recipes

`cook server`

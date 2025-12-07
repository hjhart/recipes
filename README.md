# James' Recipes!

These recipes are formatted as cooklang recipes.

If you'd like to view them, check out how to do that on their webpage.

### Simple form: How to import a recipe

```
ruby scripts/import.rb "https://www.allrecipes.com/marry-me-chicken-soup-recipe-8421914" marry-m
e-chicken-soup
```

### Long form: How to import a new recipe

`cook import https://cooking.nytimes.com/recipes/1013511-potato-leek-gratin > potato-leek-gratin.cook`
`curl https://static01.nyt.com/images/2025/11/17/multimedia/17Potato-Leek-Gratin-ltck/17Potato-Leek-Gratin-ltck-threeByTwoMediumAt2X-v2.jpg?quality=75&auto=webp > potato-leek-gratin.jpg`


If that doesn't work because it can't parse the recipe:

1. Change the URL to be prefaced by cook.md.
cook.md/

2. Try the cookifies tool on cook.md.
https://cook.md/cookifies/new

### Search for a recipe

`cook search potato`

### Ingredients

`cook shopping-list potato-leek-gratin.cook`

### Run a server showing all of the recipes

`cook server`
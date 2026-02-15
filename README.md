# James' Recipes!

These recipes are formatted as cooklang recipes.

They are hosted on [github pages](https://hjhart.github.io/recipes/)

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

## Notion Import Checklist

Recipes to transfer from the Notion export (`notion-export/Recipes/`) to `.cook` files.

- [o] 10 Minute Peanut Noodles
- [x] 20 Minute Creamy Red Pesto Beef Pasta
- [o] Air-Fryer Broccoli
- [o] Air-Fryer Tofu
- [x] All-American Beef Stew Recipe
- [o] Apple Fritter Cake
- [o] Asian Slaw with Ginger Peanut Dressing
- [x] Asparagus and Goat Cheese Frittata
- [x] Backpacking Beans and Rice
- [x] Backpacking Southwestern Burrito
- [x] Bacon Egg & Cheese Croissant Bake
- [x] Bacon, Scallion, and Caramelized Onion Dip
- [x] Baked Potato Soup
- [x] Baked Skillet Pasta With Cheddar and Spiced Onions
- [x] Bar Del Corso's Gin and Tonic
- [x] Basic Challah
- [x] Bean and Sausage Soup with Pesto
- [o] Beef Pot Pie with Gorgonzola Recipe
- [x] Berry Crush (Geraldine's Cocktail)
- [o] Big Mac Sauce
- [x] Biscuit and Gravy Casserole
- [x] Boat Breakfast Burritos
- [x] Breakfast Casserole
- [x] Breakfast Hot Pocket
- [x] Breakfast Hot Pocket #2
- [o] Breakfast Taquitos
- [o] Broccoli Cheddar Casserole
- [o] Brodo di Pollo con Pastina (Chicken Soup With Pastina)
- [o] Brown Sugar-Banana Topping
- [o] Buckeye Balls
- [x] Buttered Noodles With Jammy Eggs
- [x] Buttery Breakfast Casserole
- [x] Cacio e Pepe
- [x] Cajun Pasta
- [x] Camping Breakfast Sandwiches
- [x] Caramelised Onion Pasta Recipe
- [o] Caramelized Gochujang Tomato Soup
- [o] Caramelized Zucchini Pasta
- [o] Charleston Red Rice
- [o] Cheeseburger Garbage Bread
- [x] Cheeseburger Mac Copy Cat Hamburger Helper
- [x] Cheesy Broccoli Orzo
- [o] Cheesy Crispy Vegan Black Bean Tacos
- [o] Cheesy Onion Tart
- [ ] Cheesy Saturday Bread
- [x] Cheesy White Bean-Tomato Bake
- [ ] Chicken Alfredo Bake
- [ ] Chicken and Broccoli Baked Ziti
- [x] Chicken and Dumplings
- [ ] Chicken and Rice Soup
- [x] Chicken Bake
- [ ] Chicken Chile Verde Instant Pot
- [ ] Chicken Pot Pie with Puff Pastry
- [x] Chicken Ranch Salad
- [o] Chicken Teriyaki
- [ ] Chilaquiles Breakfast Casserole
- [x] Chilaquiles Verdes
- [ ] Chile Verde With Pork Recipe
- [o] Chili Cheese Pasta
- [o] Chinese Sausage Fried Rice
- [o] Chip Shop Curry Sauce
- [ ] Chipotle's Queso Blanco Recipe
- [o] Chopped Broccoli Salad
- [x] Chorizo and Sweet Potato Quesadillas for Two
- [ ] Cilantro Lime Pasta Salad
- [ ] Cilantro Lime Rice
- [o] Cinnamon Crunch Banana Bread
- [o] Cinnamon Syrup
- [o] Classic Okonomiyaki (Japanese Cabbage and Pork Pancakes)
- [ ] Classic Sage and Sausage Stuffing
- [o] Coconut-Gochujang Glazed Chicken With Broccoli
- [ ] Cold Cure Soup
- [ ] Cold Rice Salad
- [ ] Cooks Illustrated Chicken Salad
- [x] Corn and Avocado Salad
- [ ] Corn and Ramen Noodle Bowl Recipe
- [o] Corn Pudding Recipe
- [ ] Creamy Chicken Soup
- [o] Creamy Corn Charred Beans
- [x] Creamy Corn Pasta with Basil
- [o] Creamy Irish-Style Oatmeal With Brown Sugar Recipe
- [ ] Creamy Macaroni Salad
- [x] Creamy One-Pot Orzo With Corn and Bacon
- [ ] Creamy Peanut Ramen
- [ ] Creamy Red Curry Pasta
- [ ] Creamy Shells and Beef
- [ ] Creamy Tortellini, Spinach, and Chicken Soup
- [o] Crispy Baked Boursin
- [o] Crispy Herbed Crab Cakes Recipe
- [x] Crispy Oven Fried Bacon
- [o] Crispy Potato and Sour Cream Tart
- [o] Crispy Potato, Egg & Cheese Taco
- [ ] Crispy Rice Salad
- [ ] Crock Pot Loaded Baked Potato Soup
- [o] Crockpot Chicken Spaghetti
- [x] Cuba Libre
- [ ] Cucumber Salad With Soy, Ginger and Garlic
- [x] Cucumber Sesame Salad
- [o] Curried Chicken and Broccoli Casserole
- [ ] Deviled Egg Salad
- [o] Dill Pickle Salad
- [o] Easiest Chicken Noodle Soup
- [ ] Easy Blackberry Cobbler
- [ ] Easy Crab Cakes
- [ ] Easy Meatloaf
- [ ] Easy One-Pot Chicken Tinga (Spicy Mexican Shredded Chicken) Recipe
- [o] Easy Pull-Apart Pepperoni Garlic Knots
- [o] Easy Skillet Tamale Pie With Cornbread Crust
- [o] Easy Spinach Garlic Rolls
- [o] Easy Trader Joe's Chicken Shawarma Bowls
- [x] Egg and Onion
- [x] Egg Salad
- [x] Emily's Chocolate Chip Cookies
- [ ] Erin's Breakfast Casserole
- [x] Everything Sausage Rolls
- [ ] Extra Tangy Tartar Sauce Recipe
- [o] Feta and Zucchini Muffins
- [x] Feta Pasta with Cherry Tomatoes
- [x] Flour Bakery's Egg Sandwich
- [o] Flower Eggs
- [ ] Foolproof Pan Pizza
- [ ] French Onion Meatballs
- [x] Garlic Butter Pesto Caprese Croissants
- [ ] Garlic Herb Pull-Apart Bread
- [x] Gochuchang Mac & Cheese
- [ ] Gochujang Buttered Noodles
- [x] Gochujang Garlic Bread
- [o] Gooey Butter Cake
- [x] Gooey Cheeseburger Dip Recipe
- [ ] Great Grandma's Banana Bread
- [ ] Green Chicken Enchilada Casserole
- [x] Green Chile Rice Bake
- [ ] Grilled Chicken for Tacos, Burritos, or Salads
- [x] Grilled Corn and Avocado Salad With Feta Dressing
- [o] Grilled Orange Old-Fashioned
- [ ] Guinness Beef Stew
- [o] Halal Cart Chicken
- [x] Half a Box of Kraft
- [x] Ham and Cheese Sliders
- [o] Ham and Swiss Football Sandwiches
- [ ] Hard Boiled Eggs
- [ ] Harissa Aioli
- [ ] Honey Chili Lime Chicken
- [o] Hurricane Chips (maybe Popcorn)
- [o] In-N-Out Double Double Burger Recipe
- [ ] Instant Pot Chicken Juk
- [ ] Instant Pot Hard Boiled Eggs
- [o] Italian Penicillin (Pastina Soup)
- [ ] Italian Wonderpot
- [ ] Jalapeños & Cheddar Biscuits
- [ ] Japanese Beef Skewers (Kushiyaki)
- [ ] Jim Hart's Salmon
- [x] John's Breakfast Casserole
- [x] Jollof Rice
- [ ] Kenji's Chicago Thin-Crust Pizza
- [ ] Kenji's Simple Chili 20 Minute
- [ ] King Ranch Chicken Casserole
- [ ] Kodiak Pancakes
- [ ] Kodiak Waffles
- [ ] La Scala Chopped Salad
- [ ] Lasagna Soup
- [ ] Leek and Chicken Skillet
- [ ] Leek and Goat Cheese Quiche
- [ ] Lefse
- [ ] Lentil Soup with Cumin & Coriander Yoghurt, Lemon & Chilli
- [ ] "Life Saver Soup"
- [ ] Mac and Cheese
- [ ] Make Ahead Egg and Cheese Sandwiches
- [ ] Maple Milk Bread
- [ ] Maroulosalata (Greek Lettuce Salad)
- [ ] Marry Me Chicken
- [ ] Meatless Buffalo Dip
- [ ] Meatloaf
- [ ] Mexican Hot Chocolate Cookies
- [ ] Mexican Spanish Rice
- [ ] Mexican Street Corn Pasta Salad
- [ ] Mexican White Bean Chili
- [ ] Microwave-Steamed Eggs
- [ ] Miles Davis's Famous Chili Recipe
- [ ] Mississippi Pot Roast
- [ ] Mongolian Ground Beef and Noodles
- [ ] Monster Cookies
- [ ] Mountain Man Casserole
- [ ] Mrs Reed's Chocolate Chip Cookies
- [ ] Mujadara
- [ ] Mutter Butters
- [ ] Neely's BBQ Pasta Salad
- [ ] New Orleans-Style Red Beans and Rice Recipe
- [ ] No-Boil Pasta Bake
- [ ] No-Cook Blender Tomato Soup
- [ ] NYTimes Roquefort Sauce
- [ ] Old Cuban
- [ ] Old Fashioned
- [ ] One Pan Chicken and Gravy
- [ ] One Pot Lasagna Soup
- [ ] One Pot Sausage and Mozzarella Pasta
- [ ] One Pot Spaghetti
- [ ] One-Bowl Crispies
- [ ] One-Pan Zucchini-Pesto Orzo
- [ ] One-Pot Spaghetti Dinner
- [ ] Orange Chicken and Rice
- [ ] Orzo Pasta Bake
- [ ] Orzotto Alla Carbonara
- [ ] Oyakodon (Japanese Chicken and Egg Rice Bowl) Recipe
- [ ] Pagliacci Salad
- [ ] Pan de Muerto (Day of the Dead Bread)
- [ ] Pancake Sausage Balls
- [ ] Pão de Queijo
- [ ] Papa Tea's Chicken Fried Wontons
- [ ] Party Salsa
- [ ] Pastel Azteca (Rachel Cooks with Love)
- [ ] Peanut Butter Noodles
- [ ] Peanut Spicy Noodles
- [ ] Pear and Blue Cheese Salad
- [ ] Pesto Pasta Salad
- [ ] Pickle Schmear
- [ ] Pickled Red Onions
- [ ] Pigs in a Blanket
- [ ] Piña Colada
- [ ] Pink 75
- [ ] Popcorn #1
- [ ] Potato Salad
- [ ] Pressure Cooker Japanese Curry
- [ ] Pudgie Pie Pizza
- [ ] Queso Sauce
- [ ] Quick and Easy Pressure Cooker Chicken, Lentil, and Bacon Stew With Carrots
- [ ] Quick Chicken Adobo and Black Bean Tacos
- [ ] Ranch-Roasted Broccoli
- [ ] Really Good Oven-Fried Chicken Wings
- [ ] Rice
- [ ] Rice Frittata
- [ ] Salmon Patties
- [ ] Salmon Rillette
- [ ] Saltine Cracker Toffee
- [ ] San Francisco-Style Vietnamese American Garlic Noodles
- [ ] Sanshoku-don (Three-Color Rice Bowls)
- [ ] Sausage Balls
- [ ] Sautéed Chicken Cutlets for Two
- [ ] Sesame Chicken Chili Noodles
- [ ] Sesame Chicken Salad
- [ ] Sheet Pan Eggs
- [ ] Shepherd's Pie Twice Baked Potatoes
- [ ] Sidecar
- [ ] Skillet Chocolate Chip Cookie
- [ ] Skillet Flatbread
- [ ] Slow-Roasted Beef Tenderloin
- [ ] Slutty Dip
- [ ] Soft and Chewy Rolo Cookies
- [ ] Soft Sandwich Bread
- [ ] Sour Cream Biscuits
- [ ] Southern Broccoli Salad
- [ ] Spaghetti and Meatballs
- [x] Spicy Tuna Salad With Crispy Rice
- [ ] Spinach and Tomato Dahl
- [ ] Spring Onion Pancakes
- [ ] Stewed Lentils with Sausage
- [ ] Strawberry Jam Cookies
- [ ] Street Corn Chicken Enchilada
- [ ] Tagliatelle al Ragù
- [ ] Takeout-Style Sesame Noodles
- [ ] Tangerine Sour
- [ ] Tennessee Onions
- [ ] Thai-Inspired Chicken & Rice Noodle Soup
- [ ] Thai-Inspired Chicken Meatball Soup (NYT)
- [ ] Thai-Inspired Chicken Meatball Soup (Flavorful Life)
- [ ] Thanksgiving Stuffing Focaccia
- [ ] The Best Caesar Salad Recipe
- [ ] The Food Lab's Chocolate Chip Cookies Recipe
- [ ] Tomato Rice With Crispy Cheddar
- [ ] Tortillas
- [ ] Trader Joe's Asian-Inspired Salad
- [ ] Trader Joe's Curried Chicken Salad
- [ ] Treat Trees
- [ ] Tuna Chickpea, Cucumber and Parsley Salad
- [ ] Tuna Mayo Rice Bowl
- [ ] Tuna Salad
- [ ] Turkey & Dumplings Soup
- [ ] Turkey Enchilada Skillet
- [ ] Twice Baked Potatoes
- [ ] Twice-Baked Potato
- [ ] Ultra-Fluffy Mashed Potatoes Recipe
- [ ] Untitled
- [ ] Vegan Quinoa Salad
- [ ] Vegetable Packs with Goat Cheese
- [ ] Waffled Savory Sticky Rice
- [ ] Walla Walla Onion Dip
- [ ] White Bean, Rice and Dill Soup
- [ ] White Chicken Chili
- [ ] Woodburner Baba Ganoush
- [ ] Yakamein
- [ ] Yum Yum Sauce

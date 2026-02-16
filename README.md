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
- [x] Cheesy Saturday Bread
- [x] Cheesy White Bean-Tomato Bake
- [x] Chicken Alfredo Bake
- [x] Chicken and Broccoli Baked Ziti
- [x] Chicken and Dumplings
- [x] Chicken and Rice Soup
- [x] Chicken Bake
- [x] Chicken Chile Verde Instant Pot
- [x] Chicken Pot Pie with Puff Pastry
- [x] Chicken Ranch Salad
- [o] Chicken Teriyaki
- [x] Chilaquiles Breakfast Casserole
- [x] Chilaquiles Verdes
- [x] Chile Verde With Pork Recipe
- [o] Chili Cheese Pasta
- [o] Chinese Sausage Fried Rice
- [o] Chip Shop Curry Sauce
- [x] Chipotle's Queso Blanco Recipe
- [o] Chopped Broccoli Salad
- [x] Chorizo and Sweet Potato Quesadillas for Two
- [x] Cilantro Lime Pasta Salad
- [x] Cilantro Lime Rice
- [o] Cinnamon Crunch Banana Bread
- [o] Cinnamon Syrup
- [o] Classic Okonomiyaki (Japanese Cabbage and Pork Pancakes)
- [x] Classic Sage and Sausage Stuffing
- [o] Coconut-Gochujang Glazed Chicken With Broccoli
- [x] Cold Cure Soup
- [x] Cold Rice Salad
- [ ] Cooks Illustrated Chicken Salad
- [x] Corn and Avocado Salad
- [x] Corn and Ramen Noodle Bowl Recipe
- [o] Corn Pudding Recipe
- [x] Creamy Chicken Soup
- [o] Creamy Corn Charred Beans
- [ ] Creamy Corn Pasta with Basil
- [o] Creamy Irish-Style Oatmeal With Brown Sugar Recipe
- [x] Creamy Macaroni Salad
- [x] Creamy One-Pot Orzo With Corn and Bacon
- [x] Creamy Peanut Ramen
- [x] Creamy Red Curry Pasta
- [x] Creamy Shells and Beef
- [x] Creamy Tortellini, Spinach, and Chicken Soup
- [o] Crispy Baked Boursin
- [o] Crispy Herbed Crab Cakes Recipe
- [x] Crispy Oven Fried Bacon
- [o] Crispy Potato and Sour Cream Tart
- [o] Crispy Potato, Egg & Cheese Taco
- [x] Crispy Rice Salad
- [x] Crock Pot Loaded Baked Potato Soup
- [o] Crockpot Chicken Spaghetti
- [x] Cuba Libre
- [x] Cucumber Salad With Soy, Ginger and Garlic
- [x] Cucumber Sesame Salad
- [o] Curried Chicken and Broccoli Casserole
- [x] Deviled Egg Salad
- [o] Dill Pickle Salad
- [o] Easiest Chicken Noodle Soup
- [x] Easy Blackberry Cobbler
- [ ] Easy Crab Cakes
- [ ] Easy Meatloaf
- [x] Easy One-Pot Chicken Tinga (Spicy Mexican Shredded Chicken) Recipe
- [o] Easy Pull-Apart Pepperoni Garlic Knots
- [o] Easy Skillet Tamale Pie With Cornbread Crust
- [o] Easy Spinach Garlic Rolls
- [o] Easy Trader Joe's Chicken Shawarma Bowls
- [x] Egg and Onion
- [ ] Egg Salad
- [x] Emily's Chocolate Chip Cookies
- [x] Erin's Breakfast Casserole
- [x] Everything Sausage Rolls
- [x] Extra Tangy Tartar Sauce Recipe
- [o] Feta and Zucchini Muffins
- [ ] Feta Pasta with Cherry Tomatoes
- [x] Flour Bakery's Egg Sandwich
- [o] Flower Eggs
- [x] Foolproof Pan Pizza
- [x] French Onion Meatballs
- [ ] Garlic Butter Pesto Caprese Croissants
- [ ] Garlic Herb Pull-Apart Bread
- [x] Gochuchang Mac & Cheese
- [x] Gochujang Buttered Noodles
- [x] Gochujang Garlic Bread
- [o] Gooey Butter Cake
- [x] Gooey Cheeseburger Dip Recipe
- [ ] Great Grandma's Banana Bread
- [x] Green Chicken Enchilada Casserole
- [x] Green Chile Rice Bake
- [x] Grilled Chicken for Tacos, Burritos, or Salads
- [x] Grilled Corn and Avocado Salad With Feta Dressing
- [o] Grilled Orange Old-Fashioned
- [x] Guinness Beef Stew
- [o] Halal Cart Chicken
- [ ] Half a Box of Kraft
- [ ] Ham and Cheese Sliders
- [o] Ham and Swiss Football Sandwiches
- [ ] Hard Boiled Eggs
- [x] Harissa Aioli
- [x] Honey Chili Lime Chicken
- [o] Hurricane Chips (maybe Popcorn)
- [o] In-N-Out Double Double Burger Recipe
- [x] Instant Pot Chicken Juk
- [x] Instant Pot Hard Boiled Eggs
- [o] Italian Penicillin (Pastina Soup)
- [ ] Italian Wonderpot
- [ ] Jalapeños & Cheddar Biscuits
- [x] Japanese Beef Skewers (Kushiyaki)
- [x] Jim Hart's Salmon
- [x] John's Breakfast Casserole
- [ ] Jollof Rice
- [ ] Kenji's Chicago Thin-Crust Pizza
- [x] Kenji's Simple Chili 20 Minute
- [x] King Ranch Chicken Casserole
- [x] Kodiak Pancakes
- [x] Kodiak Waffles
- [x] La Scala Chopped Salad
- [x] Lasagna Soup
- [ ] Leek and Chicken Skillet
- [x] Leek and Goat Cheese Quiche
- [x] Lefse
- [x] Lentil Soup with Cumin & Coriander Yoghurt, Lemon & Chilli
- [x] "Life Saver Soup"
- [x] Mac and Cheese
- [x] Make Ahead Egg and Cheese Sandwiches
- [x] Maple Milk Bread
- [x] Maroulosalata (Greek Lettuce Salad)
- [x] Marry Me Chicken
- [x] Meatless Buffalo Dip
- [x] Meatloaf
- [x] Mexican Hot Chocolate Cookies
- [x] Mexican Spanish Rice
- [x] Mexican Street Corn Pasta Salad
- [x] Mexican White Bean Chili
- [x] Microwave-Steamed Eggs
- [x] Miles Davis's Famous Chili Recipe
- [x] Mississippi Pot Roast
- [x] Mongolian Ground Beef and Noodles
- [x] Monster Cookies
- [x] Mountain Man Casserole
- [ ] Mrs Reed's Chocolate Chip Cookies
- [x] Mujadara
- [x] Mutter Butters
- [x] Neely's BBQ Pasta Salad
- [ ] New Orleans-Style Red Beans and Rice Recipe
- [x] No-Boil Pasta Bake
- [x] No-Cook Blender Tomato Soup
- [x] NYTimes Roquefort Sauce
- [x] Old Cuban
- [x] Old Fashioned
- [x] One Pan Chicken and Gravy
- [x] One Pot Lasagna Soup
- [x] One Pot Sausage and Mozzarella Pasta
- [x] One Pot Spaghetti
- [x] One-Bowl Crispies
- [x] One-Pan Zucchini-Pesto Orzo
- [x] One-Pot Spaghetti Dinner
- [ ] Orange Chicken and Rice
- [ ] Orzo Pasta Bake
- [ ] Orzotto Alla Carbonara
- [x] Oyakodon (Japanese Chicken and Egg Rice Bowl) Recipe
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

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
- [ ] 20 Minute Creamy Red Pesto Beef Pasta
- [o] Air-Fryer Broccoli
- [o] Air-Fryer Tofu
- [ ] All-American Beef Stew Recipe
- [o] Apple Fritter Cake
- [o] Asian Slaw with Ginger Peanut Dressing
- [ ] Asparagus and Goat Cheese Frittata
- [ ] Backpacking Beans and Rice
- [ ] Backpacking Southwestern Burrito
- [ ] Bacon Egg & Cheese Croissant Bake
- [ ] Bacon, Scallion, and Caramelized Onion Dip
- [ ] Baked Potato Soup
- [ ] Baked Skillet Pasta With Cheddar and Spiced Onions
- [ ] Bar Del Corso's Gin and Tonic
- [ ] Basic Challah
- [ ] Bean and Sausage Soup with Pesto
- [o] Beef Pot Pie with Gorgonzola Recipe
- [ ] Berry Crush (Geraldine's Cocktail)
- [o] Big Mac Sauce
- [ ] Biscuit and Gravy Casserole
- [ ] Boat Breakfast Burritos
- [ ] Breakfast Casserole
- [ ] Breakfast Hot Pocket
- [ ] Breakfast Hot Pocket #2
- [o] Breakfast Taquitos
- [o] Broccoli Cheddar Casserole
- [o] Brodo di Pollo con Pastina (Chicken Soup With Pastina)
- [o] Brown Sugar-Banana Topping
- [o] Buckeye Balls
- [ ] Buttered Noodles With Jammy Eggs
- [ ] Buttery Breakfast Casserole
- [ ] Cacio e Pepe
- [ ] Cajun Pasta
- [ ] Camping Breakfast Sandwiches
- [ ] Caramelised Onion Pasta Recipe
- [o] Caramelized Gochujang Tomato Soup
- [o] Caramelized Zucchini Pasta
- [o] Charleston Red Rice
- [o] Cheeseburger Garbage Bread
- [ ] Cheeseburger Mac Copy Cat Hamburger Helper
- [ ] Cheesy Broccoli Orzo
- [o] Cheesy Crispy Vegan Black Bean Tacos
- [o] Cheesy Onion Tart
- [ ] Cheesy Saturday Bread
- [ ] Cheesy White Bean-Tomato Bake
- [ ] Chicken Alfredo Bake
- [ ] Chicken and Broccoli Baked Ziti
- [ ] Chicken and Dumplings
- [ ] Chicken and Rice Soup
- [ ] Chicken Bake
- [ ] Chicken Chile Verde Instant Pot
- [ ] Chicken Pot Pie with Puff Pastry
- [ ] Chicken Ranch Salad
- [o] Chicken Teriyaki
- [ ] Chilaquiles Breakfast Casserole
- [ ] Chilaquiles Verdes
- [ ] Chile Verde With Pork Recipe
- [ ] Chili Cheese Pasta
- [ ] Chinese Sausage Fried Rice
- [ ] Chip Shop Curry Sauce
- [ ] Chipotle's Queso Blanco Recipe
- [ ] Chopped Broccoli Salad
- [ ] Chorizo and Sweet Potato Quesadillas for Two
- [ ] Cilantro Lime Pasta Salad
- [ ] Cilantro Lime Rice
- [ ] Cinnamon Crunch Banana Bread
- [ ] Cinnamon Syrup
- [ ] Classic Okonomiyaki (Japanese Cabbage and Pork Pancakes)
- [ ] Classic Sage and Sausage Stuffing
- [ ] Coconut-Gochujang Glazed Chicken With Broccoli
- [ ] Cold Cure Soup
- [ ] Cold Rice Salad
- [ ] Cooks Illustrated Chicken Salad
- [ ] Corn and Avocado Salad
- [ ] Corn and Ramen Noodle Bowl Recipe
- [ ] Corn Pudding Recipe
- [ ] Creamy Chicken Soup
- [ ] Creamy Corn Charred Beans
- [ ] Creamy Corn Pasta with Basil
- [ ] Creamy Irish-Style Oatmeal With Brown Sugar Recipe
- [ ] Creamy Macaroni Salad
- [ ] Creamy One-Pot Orzo With Corn and Bacon
- [ ] Creamy Peanut Ramen
- [ ] Creamy Red Curry Pasta
- [ ] Creamy Shells and Beef
- [ ] Creamy Tortellini, Spinach, and Chicken Soup
- [ ] Crispy Baked Boursin
- [ ] Crispy Herbed Crab Cakes Recipe
- [ ] Crispy Oven Fried Bacon
- [ ] Crispy Potato and Sour Cream Tart
- [ ] Crispy Potato, Egg & Cheese Taco
- [ ] Crispy Rice Salad
- [ ] Crock Pot Loaded Baked Potato Soup
- [ ] Crockpot Chicken Spaghetti
- [ ] Cuba Libre
- [ ] Cucumber Salad With Soy, Ginger and Garlic
- [ ] Cucumber Sesame Salad
- [ ] Curried Chicken and Broccoli Casserole
- [ ] Deviled Egg Salad
- [ ] Dill Pickle Salad
- [ ] Easiest Chicken Noodle Soup
- [ ] Easy Blackberry Cobbler
- [ ] Easy Crab Cakes
- [ ] Easy Meatloaf
- [ ] Easy One-Pot Chicken Tinga (Spicy Mexican Shredded Chicken) Recipe
- [ ] Easy Pull-Apart Pepperoni Garlic Knots
- [ ] Easy Skillet Tamale Pie With Cornbread Crust
- [ ] Easy Spinach Garlic Rolls
- [ ] Easy Trader Joe's Chicken Shawarma Bowls
- [ ] Egg and Onion
- [ ] Egg Salad
- [x] Emily's Chocolate Chip Cookies
- [ ] Erin's Breakfast Casserole
- [ ] Everything Sausage Rolls
- [ ] Extra Tangy Tartar Sauce Recipe
- [ ] Feta and Zucchini Muffins
- [ ] Feta Pasta with Cherry Tomatoes
- [ ] Flour Bakery's Egg Sandwich
- [ ] Flower Eggs
- [ ] Foolproof Pan Pizza
- [ ] French Onion Meatballs
- [ ] Garlic Butter Pesto Caprese Croissants
- [ ] Garlic Herb Pull-Apart Bread
- [ ] Gochuchang Mac & Cheese
- [ ] Gochujang Buttered Noodles
- [ ] Gochujang Garlic Bread
- [ ] Gooey Butter Cake
- [ ] Gooey Cheeseburger Dip Recipe
- [ ] Great Grandma's Banana Bread
- [ ] Green Chicken Enchilada Casserole
- [ ] Green Chile Rice Bake
- [ ] Grilled Chicken for Tacos, Burritos, or Salads
- [ ] Grilled Corn and Avocado Salad With Feta Dressing
- [ ] Grilled Orange Old-Fashioned
- [ ] Guinness Beef Stew
- [ ] Halal Cart Chicken
- [ ] Half a Box of Kraft
- [ ] Ham and Cheese Sliders
- [ ] Ham and Swiss Football Sandwiches
- [ ] Hard Boiled Eggs
- [ ] Harissa Aioli
- [ ] Honey Chili Lime Chicken
- [ ] Hurricane Chips (maybe Popcorn)
- [ ] In-N-Out Double Double Burger Recipe
- [ ] Instant Pot Chicken Juk
- [ ] Instant Pot Hard Boiled Eggs
- [ ] Italian Penicillin (Pastina Soup)
- [ ] Italian Wonderpot
- [ ] Jalapeños & Cheddar Biscuits
- [ ] Japanese Beef Skewers (Kushiyaki)
- [ ] Jim Hart's Salmon
- [ ] John's Breakfast Casserole
- [ ] Jollof Rice
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

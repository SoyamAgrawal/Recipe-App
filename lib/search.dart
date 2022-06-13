import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/recipe_page.dart';
import 'services/recipe_data.dart';

class SearchRecipe extends StatefulWidget {
  @override
  State<SearchRecipe> createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
  final _searchTextController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(
                Icons.restaurant_menu,
                color: Colors.grey.shade400,
              ),
              const SizedBox(width: 10),
              Text(
                'FOOD RECIPES',
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/food.jpg',
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.4),
          colorBlendMode: BlendMode.darken,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Name Of Recipe ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'You Need...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _searchTextController,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color:Colors.white,
                  ),
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      // hintText: 'Food Name',
                      labelText: 'Food Name',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder()
                      ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (_searchTextController.text != null &&
                        _searchTextController.text.trim().isNotEmpty) {
                      setState(() {
                        isSearching = true;
                      });
                      Recipe? recipe =
                          await Recipenet.getData(_searchTextController.text);
                      setState(() {
                        isSearching = false;
                      });
                      if (recipe != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => RecipePage(
                                  recipe: recipe,
                                )),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Dish Not Found",
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Enter something to search",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Search',
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}

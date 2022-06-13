import 'package:flutter/material.dart';
import 'package:recipe_app/const.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipePage extends StatelessWidget {
  Recipe recipe;
  RecipePage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                recipe.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              recipe.name,
              style: kRecipyText.copyWith(fontSize: 30),
            ),
            Text(
              recipe.category,
              style: kRecipyText.copyWith(fontSize: 20),
            ),
            Text(
              recipe.area,
              style: kRecipyText.copyWith(fontSize: 20),
            ),
            // ListView<ingredients>(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                recipe.instruction,
                style: kRecipyText.copyWith(fontSize: 12),
              ),
            ),
      
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text((index + 1).toString(),style: kRecipyText,),
                    title: Text(recipe.ingrediants[index],style: kRecipyText,),
                    trailing: Text(recipe.measures[index],style: kRecipyText,),
                  );
                },
                itemCount: recipe.ingrediants.length,
              )
      
            //List of measure
          ],
        ),
      ),
    );
  }
}

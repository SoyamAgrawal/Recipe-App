import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/search.dart';

const String URL = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

class Recipenet {
  static Future<Recipe?> getData(String dishName) async {
    Response response = await get(Uri.parse('$URL$dishName'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['meals'] == null) {
        return null;
      }
      Recipe recipe = Recipe.getRecipeFromJson(Map.from(data['meals'][0]));
      return recipe;
    } else {
      print("Error");
      print(response.statusCode);
      return null;
    }
  }
}

// class RecipeModel {
//   Future<dynamic> getRecipeData(String recipename) async {
//     Recipenet recipenet = Recipenet('$URL$recipename');
//     var recipe = await recipenet.getData();
//     return recipe;
//   }
// }

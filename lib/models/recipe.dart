class Recipe {
  String name;
  String category;
  String area;
  String instruction;
  String thumbnail;
  List<String> ingrediants;
  List<String> measures;

  Recipe({
    required this.name,
    required this.category,
    required this.area,
    required this.instruction,
    required this.thumbnail,
    required this.ingrediants,
    required this.measures,
  });

  static Recipe getRecipeFromJson(Map data) {
    List<String> ing = [];
    for (int i = 1; i <= 20; i++) {
      String? value = data['strIngredient$i'];
      if (value != null && value.isNotEmpty) {
        ing.add(value.toString());
      }
    }
    List<String> mes = [];
    for (int i = 1; i <= 20; i++) {
      String? value = data['strMeasure$i'];
      if (value != null && value.isNotEmpty) {
        mes.add(value.toString());
      }
    }

    return Recipe(
      name: data['strMeal'],
      category: data['strCategory'],
      area: data['strArea'],
      thumbnail: data['strMealThumb'],
      instruction: data['strInstructions'],
      ingrediants: ing,
      measures: mes,
    );
  }
}

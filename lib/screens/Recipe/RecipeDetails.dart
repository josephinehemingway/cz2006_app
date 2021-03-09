

class RecipeDetails {
  final String spoonacularSourceUrl;
//has Equipment, Ingredients, Steps, e.t.c
  RecipeDetails({this.spoonacularSourceUrl,});
//The spoonacularSourceURL displays the meals recipe in our webview
  factory RecipeDetails.fromMap(Map<String, dynamic> map) {
    return RecipeDetails(
      spoonacularSourceUrl: map['spoonacularSourceUrl'],
    );
  }
}
import '../entity/CurrentUser.dart';
import '../entity/Recipe.dart';

// will change according to user's preferences
class RecommendRecipe {
  //MealPlan class has a list of meals and nutritional info about the meal plan
  CurrentUser user;

  RecommendRecipe(CurrentUser user) {
    this.user = user;
  }

  static int selectedRecipes(Recipe recipe, CurrentUser user) {
    int k = 0;
    // if (recipe.veryHealthy == false) {
    //   return 1;
    // }
    // else {
      for (int i = 0; i < user.dietaryPref.length; i++) {
        if (user.dietaryPref[i] == "Dairy Free") {
          if (recipe.dairyFree == false) {
            return 1;
          }
        }
        else if (user.dietaryPref[i] == "Gluten Free") {
          if (recipe.glutenFree == false) {
            return 1;
          }
        }
        else if (user.dietaryPref[i] == "Ketogenic") {
          if (recipe.ketogenic == false) {
            return 1;
          }
        }
        else if (user.dietaryPref[i] == "Vegan") {
          if (recipe.vegan == false) {
            return 1;
          }
        }
        else if (user.dietaryPref[i] == "Vegetarian") {
          if (recipe.vegetarian == false) {
            return 1;
          }
        }
        else if (user.dietaryPref[i] == "Whole30") {
          if (recipe.whole30 == false) {
            return 1;
          }
        }
      }

      return k;
    }
  // }
}
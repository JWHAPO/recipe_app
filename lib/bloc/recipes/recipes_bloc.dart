import 'dart:async';

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/repository/api.dart';

class RecipesBloc{
  final API api;

  StreamController<List<Recipe>> ctrl = StreamController.broadcast();
  Stream<List<Recipe>> get results => ctrl.stream;

  StreamController<Recipe> recipeController = StreamController.broadcast();
  Stream<Recipe> get recipeResult => recipeController.stream;

  RecipesBloc(this.api);

  void dispose(){
    ctrl.close();
    recipeController.close();
  }

  void getRecipes() {
    api.getRecipes().then((recipes) {
      ctrl.sink.add(recipes);
    });
  }

  void addRecipe(Recipe newRecipe){
    api.newRecipe(newRecipe);
    getRecipes();
  }

  void getRecipesFromName(String name) {
    api.getRecipesFromName(name).then((recipes) {
      ctrl.sink.add(recipes);
    });
  }

}
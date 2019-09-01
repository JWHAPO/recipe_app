import 'dart:async';

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/repository/api.dart';

class RecipesBloc{
  final API api;

  StreamController<List<Recipe>> ctrl = StreamController.broadcast();
  Stream<List<Recipe>> get results => ctrl.stream;

  RecipesBloc(this.api);

  void dispose(){
    ctrl.close();
  }

  void getRecipes() {
    api.getRecipes().then((recipes) {
      ctrl.add(recipes);
    });
  }

  void addRecipe(Recipe newRecipe){
    api.newRecipe(newRecipe).then((recipe){
//      ctrl.add(recipe);
    });
  }

  void getRecipesFromName(String name) {
    api.getRecipesFromName(name).then((recipes) {
      ctrl.add(recipes);
    });
  }

}
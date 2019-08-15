import 'dart:async';

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/repository/api.dart';

class RecipesBloc{
  final API api;

  StreamController<List<Recipe>> ctrl = StreamController();
  Stream<List<Recipe>> get results => ctrl.stream;

  RecipesBloc(this.api);

  void dispose(){
    ctrl.close();
  }

  void getRecipe(String name) {
    api.getRecipes(name).then((recipes) {
      ctrl.add(recipes);
    });
  }

}
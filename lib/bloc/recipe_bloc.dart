import 'dart:async';

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/repository/api.dart';

class RecipeBloc{
  final API api;

  StreamController<List<Recipe>> ctrl = StreamController();
  Stream<List<Recipe>> get results => ctrl.stream;

  RecipeBloc(this.api);

  void dispose(){
    ctrl.close();
  }

  void getRecipe() {
    api.getRecipes().then((recipes) {
      ctrl.add(recipes);
    });
  }

}
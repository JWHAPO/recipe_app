import 'package:flutter/material.dart';

import 'recipes_bloc.dart';
import 'package:recipe_app/repository/api.dart';


class RecipesProvider extends InheritedWidget {
  final RecipesBloc recipesBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static RecipesBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(RecipesProvider) as RecipesProvider).recipesBloc;

  RecipesProvider({Key key, RecipesBloc recipesBloc, Widget child})
    :this.recipesBloc = recipesBloc ?? RecipesBloc(API()),
     super(child: child, key: key);

}

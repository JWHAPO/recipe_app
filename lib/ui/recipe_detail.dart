import 'package:flutter/material.dart';

import 'package:recipe_app/model/recipe.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;

  RecipeDetailPage({Key key, this.recipe}) : super(key: key);

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

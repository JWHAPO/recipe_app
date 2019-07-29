import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  RecipePage();
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Recipes Page',style: TextStyle(fontFamily: 'iropke'),),
    );
  }
}

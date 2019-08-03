import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:recipe_app/model/recipe.dart';

class API {
  final http.Client _client = http.Client();

  static const String _url = "";

  //Recipe List get
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> list = [];
    String _apiName = "/recipes";

    await _client
        .get(Uri.parse(_url + _apiName))
        .then((res) => res.body)
        .then(json.decode)
        .then((recipe) => list.add(Recipe.fromJson(recipe)));

    return list;
  }
}
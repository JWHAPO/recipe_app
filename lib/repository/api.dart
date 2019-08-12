import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/model/user.dart';

class API {
  final http.Client _client = http.Client();

  static const String _url = "http://:8080";

  //Recipe List get
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> list = [];
    String _apiName = "/recipes";

    await _client
        .get(Uri.parse(_url + _apiName))
        .then((res) => res.body)
        .then(json.decode)
        .then((recipes) =>
         recipes.forEach((recipe) => list.add(Recipe.fromJson(recipe)))
    );

    return list;
  }

  //User get
  Future<List<User>> getUser() async {
    List<User> list = [];
    String _apiName = "/users/id/password";

    await _client
        .get(Uri.parse(_url + _apiName))
        .then((res) => res.body)
        .then(json.decode)
        .then((users) =>
        users.forEach((user) => list.add(User.fromJson(user)))
    );

    return list;
  }

}

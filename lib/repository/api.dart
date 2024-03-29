import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/model/user.dart';

class API {
  final http.Client _client = http.Client();

  static const String _url = "http://192.168.1.88:8080";

  //Recipe get All
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> list = [];
    String _apiName = "/recipes";

    await _client
        .get(Uri.parse(_url + _apiName))
        .catchError((error){
          print('$error');
        })
        .timeout(Duration(seconds: 30), onTimeout: (){
          print('timeout');
          return null;
        })
        .then((res) => res.body)
        .then(json.decode)
        .then((recipes) =>
         recipes.forEach((recipe) => list.add(Recipe.fromJson(recipe)))
    );

    return list;
  }

  Future<Recipe> newRecipe(Recipe recipe) async{
    Recipe newRecipe = recipe;
    String _apiName = "/recipe";

    await _client
    .post(Uri.parse(_url+_apiName), body: json.encode(newRecipe.toMap()), headers:{"Content-Type": "application/json"} )
    .catchError((error){
      print('$error');
    })
    .timeout(Duration(seconds: 30), onTimeout: (){
      print('timeout');
      return null;
    })
    .then((res) => res.body)
    .then(json.decode)
    .then((recipes) =>
        newRecipe = Recipe.fromJson(recipes)
    );

    return newRecipe;
  }

  //Recipe get list from name
  Future<List<Recipe>> getRecipesFromName(String name) async {
    List<Recipe> list = [];
    String _apiName = "/recipes/"+name;

    await _client
        .get(Uri.parse(_url + _apiName))
        .catchError((error){
      print('$error');
    })
        .timeout(Duration(seconds: 30), onTimeout: (){
      print('timeout');
    })
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
        .catchError((error){
          print('$error');
        })
        .timeout(Duration(seconds: 30), onTimeout: (){
          print('timeout');
        })
        .then((res) => res.body)
        .then(json.decode)
        .then((users) =>
        users.forEach((user) => list.add(User.fromJson(user)))
    );

    return list;
  }

}

import 'package:flutter/material.dart';

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/bloc/recipes/recipes_provider.dart';
import 'package:recipe_app/bloc/recipes/recipes_bloc.dart';
import 'package:recipe_app/ui/recipe_detail.dart';

class CreateRecipe extends StatefulWidget {
  CreateRecipe({Key key}) : super(key: key);

  @override
  _CreateRecipeState createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  RecipesBloc recipeBloc;
  final _titleTextEditingController = TextEditingController();
  final _contentsTextEditingController = TextEditingController();
  final _subTitleTextEditingController = TextEditingController();
  final _timeTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    recipeBloc = RecipesProvider.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            elevation: 0.1,
            backgroundColor: Color.fromRGBO(255, 242, 230, 1.0),
            title: Text(
              'Create recipe',
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  print('close button clicked');
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _titleTextEditingController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What is your Recipe''s name?',
                        labelText: 'Title *',
                      ),
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    TextFormField(
                      controller: _contentsTextEditingController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Write your recipe ',
                        labelText: 'Contents *',
                      ),
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    TextFormField(
                      controller: _subTitleTextEditingController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What is your Recipe''s sub title?',
                        labelText: 'Sub Title *',
                      ),
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    TextFormField(
                      controller: _timeTextEditingController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'How many time for make this?',
                        labelText: 'time(min) *',
                      ),
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      margin: EdgeInsets.only(top: 20.0),
                      height: 100,
                      width: 300,
                      child: IconButton(icon: Icon(Icons.camera_alt,color: Colors.white,), onPressed: (){

                      }),
                    )
                  ],
                ),
                flex: 9,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RaisedButton(
                          onPressed: () => onPreviewRecipe(),
                          elevation: 0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(side: BorderSide(color:Color.fromRGBO(58, 66, 86, 1.0) )),
                          child: Text(
                            'Preview',
                            style: TextStyle(
                                color: Color.fromRGBO(58, 66, 86, 1.0)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RaisedButton(
                          onPressed: () => onSaveRecipe(),
                          elevation: 0,
                          color: Color.fromRGBO(58, 66, 86, 1.0),
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                flex: 1,
              ),
            ],
          )),
    );
  }

  void onPreviewRecipe(){
    Recipe recipe = new Recipe(title: _titleTextEditingController.value.text, contents: _contentsTextEditingController.value.text, subTitle: _subTitleTextEditingController.value.text, time:_timeTextEditingController.value.text );
    Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe: recipe,)));
  }

  void onSaveRecipe(){
    setState(() {
      Recipe recipe = new Recipe(title: _titleTextEditingController.value.text, contents: _contentsTextEditingController.value.text, subTitle: _subTitleTextEditingController.value.text, time:_timeTextEditingController.value.text );
      recipeBloc.addRecipe(recipe);
    });
  }
}

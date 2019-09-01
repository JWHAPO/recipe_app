import 'package:flutter/material.dart';

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/bloc/recipes/recipes_provider.dart';
import 'package:recipe_app/bloc/recipes/recipes_bloc.dart';

class CreateRecipe extends StatefulWidget {
  CreateRecipe({Key key}) : super(key: key);

  @override
  _CreateRecipeState createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  Recipe recipe = new Recipe();
  RecipesBloc recipeBloc;

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
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What is your Recipe''s name?',
                        labelText: 'Title *',
                      ),
                      onSaved: (String value) {
                        recipe.title = value;
                      },
                      onFieldSubmitted: (String value){
                        recipe.title = value;
                      },
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What is your Recipe''s sub title?',
                        labelText: 'Sub Title *',
                      ),
                      onSaved: (String value) {
                        recipe.subTitle = value;
                      },
                      onFieldSubmitted: (String value){
                        recipe.subTitle = value;
                      },
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'How many time for make this?',
                        labelText: 'time(min) *',
                      ),
                      onSaved: (String value) {
                        recipe.time = value;
                      },
                      onFieldSubmitted: (String value){
                        recipe.time = value;
                      },
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
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
                          onPressed: () => {},
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
                          onPressed: () => {
                            onNextClick()
                          },
                          elevation: 0,
                          color: Color.fromRGBO(58, 66, 86, 1.0),
                          child: Text(
                            'Next',
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

  void onNextClick(){
    setState(() {
      recipeBloc.addRecipe(recipe);
    });
  }
}

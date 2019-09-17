import 'package:flutter/material.dart';

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/bloc/recipes/recipes_provider.dart';
import 'package:recipe_app/bloc/recipes/recipes_bloc.dart';
import 'package:recipe_app/ui/recipe_detail.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CreateRecipe extends StatefulWidget {

  CreateRecipe({Key key}) : super(key: key);

  @override
  _CreateRecipeState createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  RecipesBloc recipeBloc;
  File _image;
  int _bodyIndex = 0;
  int selectedRadio;
  String rightButtonText = 'Next';
  final int maxPageSize = 2;
  final _titleTextEditingController = TextEditingController();
  FocusNode _titleFocusNode;
  final _contentsTextEditingController = TextEditingController();
  FocusNode _contentsFocusNode;
  final _subTitleTextEditingController = TextEditingController();
  FocusNode _subTitleFocusNode;
  final _timeTextEditingController = TextEditingController();
  FocusNode _timeFocusNode;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    _titleFocusNode = FocusNode();
    _contentsFocusNode = FocusNode();
    _subTitleFocusNode = FocusNode();
    _timeFocusNode = FocusNode();
  }


  @override
  void dispose() {
    _titleFocusNode.dispose();
    _contentsFocusNode.dispose();
    _subTitleFocusNode.dispose();
    _timeFocusNode.dispose();
    super.dispose();
  }

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {

    recipeBloc = RecipesProvider.of(context);


    var firstBody = Column(
      children: <Widget>[
        TextFormField(
          controller: _titleTextEditingController,
          focusNode: _titleFocusNode,
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
          focusNode: _contentsFocusNode,
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
          focusNode: _subTitleFocusNode,
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
          focusNode: _timeFocusNode,
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
          child: _image == null ? IconButton(icon: Icon(Icons.camera_alt,color: Colors.white,), onPressed: getImage):Image.file(_image),
        )
      ],
    );


    var secondBody = Column(
      children: <Widget>[
        Text('Select type'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(value: 1,
                      groupValue: selectedRadio,
                      activeColor: Colors.green,
                      onChanged: (val){
                        print('Radio $val');
                        setSelectedRadio(val);
                      },
                ),
                Text('Type 1'),
                Radio(value: 2,
                  groupValue: selectedRadio,
                  activeColor: Colors.green,
                  onChanged: (val){
                    print('Radio $val');
                    setSelectedRadio(val);
                  },
                ),
                Text('Type 2'),
              ],
            )

          ],
        )
      ],
    );
    var thirdBody = Column(
      children: <Widget>[
        Text('Select type'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is third'),

          ],
        )
      ],
    );

    List<Widget> _bodies = [
    firstBody,
    secondBody,
    thirdBody
    ];

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
                child: _bodies[_bodyIndex],
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
                          onPressed: () => onNextClick(),
                          elevation: 0,
                          color: Color.fromRGBO(58, 66, 86, 1.0),
                          child: Text(
                            rightButtonText,
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

    if(_titleTextEditingController.value.text.replaceAll(' ', '') == ''){
      FocusScope.of(context).requestFocus(_titleFocusNode);
      return;
    }
    if(_contentsTextEditingController.value.text.replaceAll(' ', '') == ''){
      FocusScope.of(context).requestFocus(_contentsFocusNode);
      return;
    }
    if(_subTitleTextEditingController.value.text.replaceAll(' ', '') == ''){
      FocusScope.of(context).requestFocus(_subTitleFocusNode);
      return;
    }
    if(_timeTextEditingController.value.text.replaceAll(' ', '') == ''){
      FocusScope.of(context).requestFocus(_timeFocusNode);
      return;
    }

    setState(() {
      ++_bodyIndex;
      if(_bodyIndex == maxPageSize ){
        rightButtonText = 'Save';
      }
      if(_bodyIndex>maxPageSize){
        onSaveRecipe();
        _bodyIndex = 0;
      }
    });
  }

  void onPreviewRecipe(){
    Recipe recipe = new Recipe(title: _titleTextEditingController.value.text, contents: _contentsTextEditingController.value.text, subTitle: _subTitleTextEditingController.value.text, time:_timeTextEditingController.value.text );
    Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe: recipe,)));
  }

  void onSaveRecipe() {
    setState(() {
      Recipe recipe = new Recipe(title: _titleTextEditingController.value.text, contents: _contentsTextEditingController.value.text, subTitle: _subTitleTextEditingController.value.text, time:_timeTextEditingController.value.text );
      recipeBloc.addRecipe(recipe);
      Navigator.pop(context);
    });
  }
}

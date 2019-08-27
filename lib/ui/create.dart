import 'package:flutter/material.dart';


class CreateRecipe extends StatefulWidget {
  CreateRecipe({Key key}) : super(key: key);

  @override
  _CreateRecipeState createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {

  var _name= '';
  var _city= '';
  var _time= '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Color.fromRGBO(255, 242, 230, 1.0),
          title: Text('Create recipe', style: TextStyle(color: Colors.black),),
          actions: <Widget>[
            FlatButton(
                onPressed: (){
                  print('close button clicked');
                  Navigator.of(context).pop();
                  
                },
                child: Text('Close'),
                shape: CircleBorder(side: BorderSide(color: Colors.transparent)),),
          ],
        ),
        body: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What is your full name?',
                labelText: 'Name *',
              ),
              onSaved: (String value) {
                _name = value;
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Where do you live?',
                labelText: 'city *',
              ),
              onSaved: (String value) {
                _city = value;
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'How many time for make this?',
                labelText: 'time(min) *',
              ),
              onSaved: (String value) {
                _time = value;
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';


class CreateRecipe extends StatefulWidget {
  CreateRecipe({Key key}) : super(key: key);

  @override
  _CreateRecipeState createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(255, 242, 230, 1.0)),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Color.fromRGBO(255, 242, 230, 1.0),
          title: Text('Create recipe'),
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
        body: Center(
          child: Text('Create Page'),
        ),
      ),
    );
  }
}
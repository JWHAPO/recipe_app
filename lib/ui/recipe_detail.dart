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


    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0,),
        Icon(
          Icons.fastfood,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: Divider(color: Colors.green,),
        ),
        SizedBox(height: 10.0,),
        Text(widget.recipe.title, style: TextStyle(color: Colors.white, fontFamily: 'iropke', fontSize: 45.0),),
        SizedBox(height: 30.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.recipe.subTitle,
                  style: TextStyle(color: Colors.white, fontFamily: 'iropke'),
                ),
              ),
              flex: 7,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.recipe.time,
                  style: TextStyle(color: Colors.white, fontFamily: 'iropke', fontStyle: FontStyle.italic),
                ),
              ),
              flex: 3,
            )
          ],
        )
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/detail_top.jpg'),
              fit: BoxFit.cover
            )
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 0.9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 40.0,
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white,),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      widget.recipe.contents,
      style: TextStyle(fontSize: 18.0, fontFamily: 'iropke'),
    );

    final readButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: () => {
        },
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Text('ORDER RECIPE', style: TextStyle(color: Colors.white),),
      ),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
            readButton
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent,
          bottomContent
        ],
      ),
    );
  }
}

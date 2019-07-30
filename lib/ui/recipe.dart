import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  RecipePage();
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {

    final makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: Align(
          alignment: Alignment.center,
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: Image.asset('assets/images/kimchisoup.jpg',alignment: Alignment.center,fit: BoxFit.contain,),
        ),
      ),
      title: Text('보글보글 돼지고기 김치찌개',style: TextStyle(color: Colors.white, fontFamily: 'iropke', fontWeight: FontWeight.bold),),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.yellowAccent),
          Text('김치, 고기, 파, 양파', style: TextStyle(color: Colors.white, fontFamily: 'iropke',))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color:Colors.white, size: 30.0,),
    );

    final makeCard = Card(
      elevation: 0.8,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, 0.9)),
        child: makeListTile,
      ),
    );

    final makeBody = Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return makeCard;
          }
      ),
    );

    return Center(
      child: makeBody,
    );
  }
}

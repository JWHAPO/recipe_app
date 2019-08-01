import 'package:flutter/material.dart';

import 'package:recipe_app/model/recipe.dart';

class RecipePage extends StatefulWidget {
  RecipePage();
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List recipes;
  List getRecipes(){
    return [
      Recipe(
          title: "Kimchi Rice",
          subTitle: "Nice Korean Food",
          time: 20
      ),
      Recipe(
          title: "Gamja Rice",
          subTitle: "Nice Korean Food",
          time: 30
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recipes = getRecipes();
  }
  @override
  Widget build(BuildContext context) {

    ListTile  makeListTile(Recipe recipe) => ListTile(
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
      title: Text(recipe.title,style: TextStyle(color: Colors.white, fontFamily: 'iropke', fontWeight: FontWeight.bold),),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.yellowAccent),
          Text(recipe.subTitle, style: TextStyle(color: Colors.white, fontFamily: 'iropke',))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color:Colors.white, size: 30.0,),
    );

    Card makeCard(Recipe recipe) => Card(
      elevation: 0.8,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, 0.9)),
        child: makeListTile(recipe),
      ),
    );

    final makeBody = Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index){
            return makeCard(recipes[index]);
          }
      ),
    );

    return Center(
      child: makeBody,
    );
  }
}

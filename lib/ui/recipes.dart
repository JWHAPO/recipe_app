import 'package:flutter/material.dart';

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/ui/recipe_detail.dart';
import 'package:recipe_app/bloc/recipes/recipes_provider.dart';

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
          title: 'Kimchi Rice',
          subTitle: 'Nice Korean Food',
          contents: '요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법',
          time: '20 min'
      ),
      Recipe(
          title: 'Gamja Rice',
          subTitle: 'Nice Korean Food',
          contents: '요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법',
          time: '30 min'
      ),
      Recipe(
          title: 'Pasta',
          subTitle: 'Italy Trasitional Food',
          contents: '요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법',
          time: '10 min'
      ),
      Recipe(
          title: 'Tomyangkkung',
          subTitle: 'Tailand Trasitional Food',
          contents: '요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법',
          time: '120 min'
      ),
      Recipe(
          title: 'Kimchi Rice',
          subTitle: 'Nice Korean Food',
          contents: '요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법',
          time: '20 min'
      ),
      Recipe(
          title: 'Gamja Rice',
          subTitle: 'Nice Korean Food',
          contents: '요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법',
          time: '30 min'
      ),
      Recipe(
          title: 'Pasta',
          subTitle: 'Italy Trasitional Food',
          contents: '요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법',
          time: '10 min'
      ),
      Recipe(
          title: 'Tomyangkkung',
          subTitle: 'Tailand Trasitional Food',
          contents: '요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법요리법',
          time: '120 min'
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

    final recipeBloc = RecipesProvider.of(context);
    recipeBloc.getRecipe();

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
      title: Text(recipe.title,style: TextStyle(color: Colors.pinkAccent, fontFamily: 'iropke', fontWeight: FontWeight.bold),),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.blueAccent),
          Text(recipe.subTitle, style: TextStyle(color: Colors.pinkAccent, fontFamily: 'iropke',))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color:Colors.pinkAccent, size: 30.0,),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe: recipe,)));
      },
    );

    Card makeCard(Recipe recipe) => Card(
      elevation: 0.8,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 235, 254, 0.6)),
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

    final makeBody2 = StreamBuilder(
      stream: recipeBloc.results,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Text('No Data');
        }else{
          return ListView.builder(
            itemBuilder: (context,index) => null,
            itemCount: snapshot.data.length,
          );
        }
      },
    );

    return Center(
      child: makeBody,
    );
  }
}

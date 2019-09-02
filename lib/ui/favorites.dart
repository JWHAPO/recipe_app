import 'package:flutter/material.dart';
import 'package:recipe_app/bloc/recipes/recipes_provider.dart';
import 'package:recipe_app/ui/recipe_detail.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage();
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {

    final recipeBloc = RecipesProvider.of(context);
    recipeBloc.getRecipes();

    return StreamBuilder(
      stream: recipeBloc.results,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Text('No Data');
        }else if(snapshot.hasError){
          return Text('Occured Error');
        }else{
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) => makeCard(snapshot, index),
              itemCount: snapshot.data == null? 0 :snapshot.data.length
          );
        }
      },
    );
  }

Card makeCard(AsyncSnapshot snapshot, int index) => Card(
  color: Colors.white,
  child: GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe: snapshot.data[index],)));
    },
    child: Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Image.network(snapshot.data[index].imageUrl,width: 60.0, height: 60.0,),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(snapshot.data[index].title, style: TextStyle(fontFamily: 'iropke'),),
        ),

      ],
    ),
  ),
);

}

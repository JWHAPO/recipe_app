import 'package:flutter/material.dart';
import 'package:recipe_app/bloc/recipes/recipes_provider.dart';

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
              itemBuilder: (context, index) => makeCard(snapshot, index)
          );
        }
      },
    );
  }

Card makeCard(AsyncSnapshot snapshot, int index) => Card(
  color: Colors.white,
  child: Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(snapshot.data[index].imageUrl,width: 60.0, height: 60.0,),
        Text(snapshot.data[index].title, style: TextStyle(fontFamily: 'iropke'),)
      ],
    ),
  ),
);

}

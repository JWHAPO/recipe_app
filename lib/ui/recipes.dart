import 'package:flutter/material.dart';

import 'package:recipe_app/ui/recipe_detail.dart';
import 'package:recipe_app/bloc/recipes/recipes_provider.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  TextEditingController editingController = TextEditingController();

  ListTile  makeListTile(AsyncSnapshot snapshot, int index) {
    var id = snapshot.data[index].id;
    var title = snapshot.data[index].title;
    var subTitle = snapshot.data[index].subTitle;
    var contents = snapshot.data[index].contents;
    var time = snapshot.data[index].time;


    return ListTile(
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
      title: Text(title,style: TextStyle(color: Colors.pinkAccent, fontFamily: 'iropke', fontWeight: FontWeight.bold),),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.blueAccent),
          Text(subTitle, style: TextStyle(color: Colors.pinkAccent, fontFamily: 'iropke',))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color:Colors.pinkAccent, size: 30.0,),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(recipe: snapshot.data[index],)));
      },
    );
  }

  Card makeCard(AsyncSnapshot snapshot, int index) => Card(
    elevation: 0.8,
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(255, 235, 254, 0.6)),
      child: makeListTile(snapshot, index),
    ),
  );

  @override
  Widget build(BuildContext context) {

    final recipeBloc = RecipesProvider.of(context);
    recipeBloc.getRecipes();



    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value){
                    print('onChanged:$value');
                  },
                  onEditingComplete: (){
                    print('onEditingComplete');
                  },
                  onSubmitted: (value){
                    print('onSubmit:$value');
                    recipeBloc.getRecipesFromName(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                    )
                  ),
                ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: recipeBloc.results,
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return Text('No Data');
                  }else if(snapshot.hasError){
                    return Text('Occured Error');
                  }else{
                    return ListView.builder(
                      itemBuilder: (context,index) => makeCard(snapshot, index),
                      itemCount: snapshot.data == null? 0 :snapshot.data.length,
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

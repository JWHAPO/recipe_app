import 'package:flutter/material.dart';

import 'package:recipe_app/ui/splash.dart';
import 'package:recipe_app/ui/recipes.dart';
import 'package:recipe_app/ui/world.dart';
import 'package:recipe_app/ui/favorites.dart';
import 'package:recipe_app/ui/my.dart';
import 'package:recipe_app/bloc/recipes/recipes_provider.dart';
import 'package:recipe_app/bloc/recipes/recipes_bloc.dart';
import 'package:recipe_app/repository/api.dart';
import 'package:recipe_app/ui/create.dart';
import 'package:recipe_app/ui/login.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {

  var routes = <String, WidgetBuilder>{
    '/main':(BuildContext context) => MyHomePage(key: Key("mainPage"), title: "Recipe",),
    '/create':(BuildContext context) => RecipesProvider(recipesBloc: RecipesBloc(API()), child:CreateRecipe(key: Key("mainPage"),),),
    '/login':(BuildContext context) => LoginPage(key: Key("loginPage"))
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(255, 242, 230, 1.0)),
      routes: routes,
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  var _tab1Icon = Icon(Icons.home, color:Colors.blue);
  var _tab2Icon = Icon(Icons.map, color:Colors.grey);
  var _tab3Icon = Icon(Icons.add_circle_outline, color:Colors.grey);
  var _tab4Icon = Icon(Icons.bookmark, color:Colors.grey);
  var _tab5Icon = Icon(Icons.person, color:Colors.grey);
  final List<Widget> _tabChildren = [
    RecipesProvider(recipesBloc: RecipesBloc(API()), child:RecipePage(),),
    WorldPage(),
    null,
    RecipesProvider(recipesBloc: RecipesBloc(API()), child:FavoritesPage(),),
    MyPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(255, 242, 230, 1.0),
      title: Text(widget.title),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(255, 242, 230, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: _tab1Icon,
              onPressed: (){
                onTabTapped(0);
              },
            ),
            IconButton(
              icon: _tab2Icon,
              onPressed: (){
                onTabTapped(1);
              },
            ),
            IconButton(
              icon: _tab3Icon,
              onPressed: (){
                onTabTapped(2);
              },
            ),
            IconButton(
              icon: _tab4Icon,
              onPressed: (){
                onTabTapped(3);
              },
            ),
            IconButton(
              icon: _tab5Icon,
              onPressed: (){
                onTabTapped(4);
              },
            )
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: topAppBar,
      backgroundColor: Color.fromRGBO(255, 242, 230, 1.0),
      body: _tabChildren[_currentIndex],
      bottomNavigationBar: makeBottom,
    );
  }
  void onTabTapped(int index) {
    setState(() {

      if(index==2){
        print('open create page');
        Navigator.pushNamed(context, '/create');
      }else{
        _currentIndex = index;
        _tab1Icon = Icon(Icons.home, color:Colors.grey);
        _tab2Icon = Icon(Icons.map, color:Colors.grey);
        _tab3Icon = Icon(Icons.add_circle_outline, color:Colors.grey);
        _tab4Icon = Icon(Icons.bookmark, color:Colors.grey);
        _tab5Icon = Icon(Icons.person, color:Colors.grey);
        switch(_currentIndex){
          case 0:
            _tab1Icon = Icon(Icons.home, color:Colors.blue);
            break;
          case 1:
            _tab2Icon = Icon(Icons.map, color:Colors.blue);
            break;
          case 2:

            break;
          case 3:
            _tab4Icon = Icon(Icons.bookmark, color:Colors.blue);
            break;
          case 4:
            _tab5Icon = Icon(Icons.person, color:Colors.blue);
            break;
        }
      }



    });
  }
}

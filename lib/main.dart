import 'package:flutter/material.dart';

import 'package:recipe/ui/splash.dart';
import 'package:recipe/ui/recipe.dart';
import 'package:recipe/ui/world.dart';
import 'package:recipe/ui/favorites.dart';
import 'package:recipe/ui/my.dart';

void main() => runApp(MyApp());

var routes = <String, WidgetBuilder>{
  '/main':(BuildContext context) => MyHomePage(key: Key("mainPage"), title: "Recipe",)
};

class MyApp extends StatelessWidget {
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
  final List<Widget> _tabChildren = [
    RecipePage(),
    WorldPage(),
    FavoritesPage(),
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
      actions: <Widget>[
        IconButton(icon: Icon(Icons.list), onPressed: (){

        })
      ],
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(255, 242, 230, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color:Colors.grey),
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(Icons.map, color:Colors.grey),
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(Icons.bookmark, color:Colors.grey),
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(Icons.bookmark, color:Colors.grey),
              onPressed: (){

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
      _currentIndex = index;
    });
  }
}

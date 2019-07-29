import 'package:flutter/material.dart';

import 'package:recipe/ui/splash.dart';
import 'package:recipe/ui/recipe.dart';
import 'package:recipe/ui/world.dart';
import 'package:recipe/ui/favorites.dart';
import 'package:recipe/ui/my.dart';

void main() => runApp(MyApp());

var routes = <String, WidgetBuilder>{
  '/main':(BuildContext context) => MyHomePage(key: Key("myHomePage"), title: "Recipe",)
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _tabChildren[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.view_list), title: Text('Recipes', style: TextStyle(fontFamily: 'iropke'),)),
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('World', style: TextStyle(fontFamily: 'iropke'),)),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Text('Favorites', style: TextStyle(fontFamily: 'iropke'),)),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My', style: TextStyle(fontFamily: 'iropke'),)),
      ],
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

    });
  }
}

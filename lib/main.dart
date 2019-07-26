import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Recipe'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Start Toy Project',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.view_list)),
        BottomNavigationBarItem(icon: Icon(Icons.map)),
        BottomNavigationBarItem(icon: Icon(Icons.add)),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark)),
        BottomNavigationBarItem(icon: Icon(Icons.settings)),
      ],
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

    });
  }
}

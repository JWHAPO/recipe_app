import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class ManeDashboardPage extends StatefulWidget {

  @override
  _ManeDashboardPageState createState() => _ManeDashboardPageState();
}

class _ManeDashboardPageState extends State<ManeDashboardPage> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[

        ],
      ),
    );
  }

  Widget menu(context){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Messages', style: TextStyle(color: Colors.white, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Utility Bills', style: TextStyle(color: Colors.white, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Funds Trasfer', style: TextStyle(color: Colors.white, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Branches', style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
        ),
      ),
    );
  }

  Widget dashboard(context){
    return Material(
      elevation: 8,
      color: backgroundColor,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.menu, color: Colors.white,),
                Text('My Card', style: TextStyle(fontSize: 24, color: Colors.white),),
                Icon(Icons.settings, color: Colors.white,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

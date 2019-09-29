import 'package:flutter/material.dart';

class ManeDashboardPage extends StatelessWidget {

  final Color backgroundColor = Color(0xFF4A4A58);

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
}

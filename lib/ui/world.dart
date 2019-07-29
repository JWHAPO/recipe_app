import 'package:flutter/material.dart';

class WorldPage extends StatefulWidget {
  WorldPage();
  @override
  _WorldPageState createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('World Page',style: TextStyle(fontFamily: 'iropke'),),
    );
  }
}

import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {

  MyPage();
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Page',style: TextStyle(fontFamily: 'iropke'),),
    );
  }
}

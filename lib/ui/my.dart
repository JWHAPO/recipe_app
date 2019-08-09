import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {

  MyPage();
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox.expand(
          child: RaisedButton(
            onPressed: (){

            },
            child: Text('개인정보', style: TextStyle(fontFamily: 'iropke'),),
          ),
        )
      ],
    );
  }
}

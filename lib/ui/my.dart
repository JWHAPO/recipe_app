import 'package:flutter/material.dart';
import 'package:recipe_app/ui/notice.dart';
import 'package:recipe_app/ui/event.dart';

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
        Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://cdn.pixabay.com/photo/2017/05/13/12/40/fashion-2309519_960_720.jpg')
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.blueGrey
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Jengwoo Kim', style: TextStyle(fontFamily: 'iropke', fontSize: 20.0, fontWeight: FontWeight.bold),),
                Text('등급 : 최고등급', style: TextStyle(fontFamily: 'iropke', fontSize: 14.0),),
              ],
            )
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.pinkAccent,
            onPressed: (){

            },
            child: Text('개인정보', style: TextStyle(fontFamily: 'iropke'),),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.pinkAccent,
            onPressed: (){

            },
            child: Text('공지사항', style: TextStyle(fontFamily: 'iropke'),),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.pinkAccent,
            onPressed: (){

            },
            child: Text('이벤트', style: TextStyle(fontFamily: 'iropke'),),
          ),
        )
      ],
    );
  }
}

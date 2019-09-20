import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            'https://cdn.pixabay.com/photo/2019/09/17/12/52/landscape-4483411_1280.jpg',
            fit: BoxFit.fill,
            color: Color.fromRGBO(255, 255, 255, 0.6),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.0,),
            Container(
              width: 250.0,
              child: Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      SizedBox(width: 10.0,),
                      Text('Sign in with Google', style: TextStyle(color: Colors.black, fontSize: 18.0),)
                    ],
                  ),
                  onPressed: (){

                  },
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

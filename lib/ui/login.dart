import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/main.dart';
import 'package:recipe_app/model/google_user.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool isLoggedIn = false;

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
                    signInWithGoogle().then((FirebaseUser user) => print(user)).catchError((e) => print(e));
//                    signInWithGoogle().whenComplete((){
//                      Navigator.of(context).push(
//
//                          MaterialPageRoute(builder: (context){
//                            return MyHomePage(key: Key("mainPage"), title: "Recipe",);
//                          },
//                          )
//
//                        );
//                      }
//                    );

                  },
                ),
              ),
            ),
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
                      Icon(Icons.face),
                      SizedBox(width: 10.0,),
                      Text('Sign in with Facebook', style: TextStyle(color: Colors.black, fontSize: 18.0),)
                    ],
                  ),
                  onPressed: (){
                    initiateFacebookLogin();
                  },
                ),
              ),
            ),
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
                      Icon(Icons.email),
                      SizedBox(width: 10.0,),
                      Text('Sign in with Email', style: TextStyle(color: Colors.black, fontSize: 18.0),)
                    ],
                  ),
                  onPressed: (){
                    //email login method
                  },
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(user.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    GoogleUser googleUser = new GoogleUser(user.providerId, user.displayName, user.photoUrl, user.email, providerData);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    isLoggedIn = true;
    Navigator.of(context).push(

        MaterialPageRoute(builder: (context){
          return MyHomePage(key: Key("mainPage"), title: "Recipe",);
          //return MyHomePage(key:Key("mainPage"), title: "Recipe", user: googleUser),
        },
        )

    );

    return user;
  }

  void onLoginStatusChanged(bool isLoggedIn){
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
        await facebookLogin.logIn(['email']);

    switch(facebookLoginResult.status){
      case FacebookLoginStatus.error:
        print('Facebook Login Error');
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('CancelledFacebookLoginByUser');
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print('LoggedIn');
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult
                .accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print(profile.toString());

        onLoginStatusChanged(true);
        break;
    }
  }

  void signOutGoogle() async{
    await googleSignIn.signOut();

    print('User Sign Out');
  }
}

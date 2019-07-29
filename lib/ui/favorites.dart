import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage();
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Page',style: TextStyle(fontFamily: 'iropke'),),
    );
  }
}

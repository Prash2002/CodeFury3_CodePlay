import 'package:CodeFury3/models/user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final User currentUser;

  Home({this.currentUser}) ;
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Home')
    );
  }
}
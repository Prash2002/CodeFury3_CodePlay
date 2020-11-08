import 'package:CodeFury3/widgets/slides.dart';
import 'package:CodeFury3/pages/artists_list.dart';
import 'package:flutter/material.dart';

import 'pages/auth/login.dart';
// import 'pages/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bevy',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primaryColor: Color(0xFFF15D4F),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Nunito',
      ),
      home: IntroScreen(),
    // home: ArtistsList(),
  );
  }
}


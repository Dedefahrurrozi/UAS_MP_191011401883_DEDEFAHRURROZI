import 'package:flutter/material.dart';
import 'package:news_app/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '191011401883_Dede Fahrurrozi',
      theme: ThemeData(appBarTheme: AppBarTheme(elevation: 0)),
      home: Home (),
    );
  }
}
       
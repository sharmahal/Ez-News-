import 'package:flutter/material.dart';
import 'package:news/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newws',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: Home(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:moviesapi/pages/home_page.dart';
import 'package:moviesapi/widget_model/modal.dart';

void main() => runApp(MyApp());
Modal modal = Modal();
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}


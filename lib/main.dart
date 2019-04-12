import 'package:flutter/material.dart';
import 'package:flutter_movieapp/custom_movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: CustomGridView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

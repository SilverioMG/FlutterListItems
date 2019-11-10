import 'package:flutter/material.dart';
import 'package:flutter_listitems/widget/random_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: 'List Items',
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        primaryColorDark: Colors.lightGreen[800],
        primaryColorLight: Colors.lightGreen[100],
        accentColor: Colors.red[300]
      ),
      home: RandomWords()
    );
  }

}
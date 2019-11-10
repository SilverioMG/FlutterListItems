import 'package:flutter/material.dart';
import 'package:flutter_listitems/widget/random_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: 'List Items',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to ListItems on Flutter"),
        ),
        body: Center(
          child: RandomWords(),
        )
      )
    );
  }
}
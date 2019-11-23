import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_listitems/src/pages/random_words.dart';
import 'package:flutter_listitems/src/pages/saved_words.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Items',
      theme: ThemeData(
          primaryColor: Colors.lightGreen,
          primaryColorDark: Colors.lightGreen[800],
          primaryColorLight: Colors.lightGreen[100],
          accentColor: Colors.red[300]
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RandomWords(),
        '/saved': (context) => SavedWords()
      },
//home: RandomWords() //No se indica si se especifica el parámetro 'initialRoute'.
    );
  }

}
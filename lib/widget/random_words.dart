import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget{

  @override
  _RandomWordsState createState() => _RandomWordsState();

}

class _RandomWordsState extends State<RandomWords>{
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _fontSizeStyle = TextStyle(fontSize: 32.0);

  @override
  Widget build(BuildContext context){
    //final WordPair wordPair = WordPair.random();
    //return Text(wordPair.asCamelCase,
    //style: TextStyle(fontSize: 32.0, color:Colors.black));

    return _buildSuggestions();

//    return Scaffold(
//      appBar: AppBar(
//          title: Text('Items Generator'),
//      ),
//      body: _buildSuggestions()
//    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: EdgeInsets.all(15),
        itemBuilder: (BuildContext _context, int i){
        //Si la línea es impar se muestra un divisor en vez del valor correspondiente de '_suggestions'.
        if(i.isOdd){
          return Divider();
        }

        //El operador '~/2' se utiliza para realizar 'división entera'.
        final int index = i ~/ 2;
        if(index >= _suggestions.length){
          //Si se llega al límite de valores de la lista '_suggestions' se añaden nuevos items a la lista.
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
       pair.asCamelCase,
       style: _fontSizeStyle
      )
    );
  }
}
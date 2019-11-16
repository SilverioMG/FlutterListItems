import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_listitems/widget/saved_words.dart';

class RandomWords extends StatefulWidget{

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _fontSizeStyle = TextStyle(fontSize: 20.0);
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    //final WordPair wordPair = WordPair.random();
    //return Text(wordPair.asCamelCase,
    //style: TextStyle(fontSize: 32.0, color:Colors.black));

    //return _buildSuggestions();

    return Scaffold(
        appBar: AppBar(
            title: Text("Welcome to ListItems on Flutter"),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
            ]
        ),
        body: Center(
          child: _buildSuggestions(),
        )
    );
  }

  //Navegación a Vista 'Saved' pasándole como argumento la listas de elementos guardados que debe mostrar.
  void _pushSaved(){
    Navigator.of(context).pushNamed('/saved', arguments: ParamsNavigationSavedWords(_saved));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(15),
        itemBuilder: (BuildContext _context, int i) {
          //Si la línea es impar se muestra un divisor en vez del valor correspondiente de '_suggestions'.
          if (i.isOdd) {
            return Divider();
          }

          //El operador '~/2' se utiliza para realizar 'división entera'.
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            //Si se llega al límite de valores de la lista '_suggestions' se añaden nuevos items a la lista.
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    bool _alreadySaved = _saved.contains(pair);

    return ListTile(
        title: Text(
            pair.asCamelCase,
            style: _fontSizeStyle
        ),
        trailing: Icon(Icons.shopping_cart,
            color: _alreadySaved ? Colors.black : Colors.black38
        ),
      onTap: (){
          setState(() {
            //Se llama al método 'build' de este 'WidgetState' y se vuelve a dibujar el 'Widget' entero con el nuevo 'State'.
            if(_alreadySaved){
              _saved.remove(pair);
            }
            else{
              _saved.add(pair);
            }
          });
      },
    );
  }

}
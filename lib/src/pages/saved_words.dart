import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedWords extends StatefulWidget{
  Set<WordPair> _savedItems;

  SavedWords({savedItems}){
    this._savedItems = (savedItems != null) ? savedItems : Set<WordPair>();
  }

  @override
  _SavedWordState createState() => _SavedWordState(_savedItems);
}

class _SavedWordState extends State<SavedWords>{
  Set<WordPair> _savedItems;
  final TextStyle _fontSizeStyle = TextStyle(fontSize: 20.0);

  _SavedWordState(Set<WordPair> this._savedItems); //{}

  @override
  Widget build(BuildContext context) {
    //Si se recibe la lista de items a mostrar como un parámetro de navegación entonces se utiliza dicho
    //parámetro en vez del recibido como parámetro de este 'contructor'.
    ParamsNavigationSavedWords paramsNavitagation = ModalRoute.of(context).settings.arguments;
    if(paramsNavitagation != null){
      this._savedItems = paramsNavitagation.savedItems;
    }

    final Iterable<ListTile> tiles = _savedItems.map(
            (WordPair pair) {
          return ListTile(
              title: Text(
                  pair.asCamelCase,
                  style: _fontSizeStyle
              )
          );
        }
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Saved Items'),
        ),
        body: Center(
          child: ListView(children: divided)
        )
    );

  }
}

class ParamsNavigationSavedWords{
  Set<WordPair> savedItems;
  ParamsNavigationSavedWords(Set<WordPair> savedItems){
    this.savedItems = (savedItems != null) ? savedItems : Set<WordPair>();
  }
}
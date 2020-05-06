import 'package:canta_cuvantul/wordspage.dart';
import 'package:flutter/material.dart';
import 'backgroundGradient.dart';
import 'wordIndex.dart';
import 'Backend/Database_model.dart';

WordIndex wordInd = WordIndex();

class PlayerPoints extends StatefulWidget {
  @override
  _PlayerPointsState createState() => _PlayerPointsState();
}

class _PlayerPointsState extends State<PlayerPoints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
          future: Word().runQuery(wordIndex.getRmd()),
          initialData: List(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      BackgroundGradientBlue(),
                      ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, int position) {
                          final item = snapshot.data[position];
                          //get your item data here ...
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data[position].row[1]),
                            ),
                          );
                        },
                      ),
                      FlatButton(
                        onPressed: () {
                          WordIndex().generateRandom();
                          WordIndex().counterIncrease();
                          print(WordIndex().getCounter());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WordsPage()),
                          );
                        },
                        child: Text('Next word'),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
/*
Stack(
        children: <Widget>[
          BackgroundGradientBlue(),
          SafeArea(
            child: FlatButton(
              onPressed: () {
                WordIndex().generateRandom();
                WordIndex().counterIncrease();
                print(WordIndex().getCounter());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordsPage()),
                );
              },
              child: Text('Next word'),
            ),
          ),
        ],
      ),*/

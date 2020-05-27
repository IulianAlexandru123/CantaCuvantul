import 'package:canta_cuvantul/main.dart';
import 'package:canta_cuvantul/playerspage.dart';
import 'package:canta_cuvantul/wordspage.dart';
import 'package:flutter/material.dart';
import 'backgroundGradient.dart';
import 'wordIndex.dart';
import 'Backend/Database_model.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
//import 'sizehelpers.dart';

WordIndex wordInd = WordIndex();

class PlayerPoints extends StatefulWidget {
  @override
  _PlayerPointsState createState() => _PlayerPointsState();
}

class _PlayerPointsState extends State<PlayerPoints> {
  int flex_ratio;
  Icon buton = Icon(Icons.play_circle_outline);
  List<Color> _player_color = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  Color pointsColor = Colors.black;
  void ratio() {
    if (counter == 2)
      flex_ratio = 6;
    else if (counter == 3 && counter == 4)
      flex_ratio = 3;
    else if (counter == 5 && counter == 6) flex_ratio = 1;
  }

  final assetsAudioPlayer = AssetsAudioPlayer();

  void play() async {
    try {
      await assetsAudioPlayer.open(
        Audio.network("http://www.youtube.com/watch?v=8aMgTIMHjLE"),
      );
    } catch (t) {
      //mp3 unreachable
    }
  }

  @override
  void initState() {
    ratio();

    for (int i = 0; i < counter; i++) {
      print(useri[i].name);
      print(useri[i].caracter);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
          future: Word().runQuery(wordIndex.getRmd(), false),
          initialData: List(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      BackgroundGradient(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Text(
                              'Adauga puncte: ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Josefin',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GridView.builder(
                              itemCount: counter,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2,
                                mainAxisSpacing: 20,
                              ),
                              itemBuilder: (_, int index) {
                                //  final item = snapshot.data[position];
                                //get your item data here ...

                                return FlatButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      useri[index].points++;
                                      _player_color[index] = Colors.red;
                                    });
                                  },
                                  child: Card(
                                    // shadowColor: Colors.black,

                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 0),
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        AspectRatio(
                                          aspectRatio: 0.8,
                                          child: Image.asset(
                                            useri[index].caracter,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(useri[index].name),
                                            Divider(
                                              height: 5,
                                            ),
                                            Text(
                                                'Puncte: ${useri[index].points}',
                                                style: TextStyle(
                                                  color: _player_color[index],
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.all(15),
                              child: Text('Melodii posibile: ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: 'Josefin',
                                    fontWeight: FontWeight.bold,
                                  ))),
                          Expanded(
                            flex: flex_ratio,
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (_, int position) {
                                //get your item data here ...

                                return FlatButton(
                                  onPressed: () {
                                    play();
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 0),
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    color: Colors.amber[800],
                                    child: ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(snapshot.data[position].row[1]),
                                          IconButton(
                                            icon: buton,
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            color: Colors.black,
                                            onPressed: () {
                                              setState(() {
                                                buton = Icon(
                                                    Icons.pause_circle_outline);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Artist: " +
                                              snapshot.data[position].row[2]),
                                          Text(
                                              "An: ${snapshot.data[position].row[3]}"),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RaisedButton(
                                  color: Colors.red,
                                  onPressed: null,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                  ),
                                  child: Text(
                                    'Mai multe melodii posibile',
                                  ),
                                ),
                                RaisedButton(
                                  color: Color(0xFF558B2F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                  ),
                                  onPressed: () {
                                    if (WordIndex().isOk() == true) {
                                      WordIndex().generateRandom();
                                      WordIndex().counterIncrease();
                                      print(WordIndex().getCounter());

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WordsPage()),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10),
                                            title: Text(
                                              'Game OVER!',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Rubik',
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            backgroundColor: Colors.blueGrey,
                                            content: FlatButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          StartPage()),
                                                );
                                              },
                                              child: Text(
                                                  "Inapoi la pagina principala"),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Next round',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

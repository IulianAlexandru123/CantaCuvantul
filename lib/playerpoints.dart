import 'package:canta_cuvantul/main.dart';
import 'package:canta_cuvantul/playerspage.dart';
import 'package:canta_cuvantul/wordspage.dart';
import 'package:flutter/material.dart';
import 'backgroundGradient.dart';
import 'wordIndex.dart';
import 'Backend/Database_model.dart';
//import 'sizehelpers.dart';

WordIndex wordInd = WordIndex();

class PlayerPoints extends StatefulWidget {
  @override
  _PlayerPointsState createState() => _PlayerPointsState();
}

class _PlayerPointsState extends State<PlayerPoints> {
  int flex_ratio;
  Color pointsColor = Colors.black;
  void ratio() {
    if (useri.length == 2)
      flex_ratio = 4;
    else if (useri.length == 3 && useri.length == 4)
      flex_ratio = 3;
    else if (useri.length == 5 && useri.length == 6) flex_ratio = 1;
  }

  /*List<User> users = [];

  SharedPref sharedPref = SharedPref();
  loadUser() async {
    for (int i = 0; i < counter; i++) {
      users.add(User.fromJson(await sharedPref.read("$i")));
      // users.sort((b, a) => a.points.compareTo(b.points));
      print(users[i].name);
      print(users[i].points);
      print(users[i].caracter);
    }
  }
*/
  @override
  void initState() {
    ratio();
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
                              itemCount: useri.length,
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
                                    /*    setState(() {
                                      userSave.points = users[index].points + 1;
                                      userSave.name = users[index].name;
                                      userSave.caracter = users[index].caracter;
                                      users[index].points++;
                                      sharedPref.save("$index", userSave);
                                    });*/
                                    setState(() {
                                      useri[index].points++;
                                      pointsColor = Colors.red;
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
                                                  color: pointsColor,
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
                                  onPressed: null,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 0),
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    color: Colors.amber[800],
                                    child: ListTile(
                                      title:
                                          Text(snapshot.data[position].row[1]),
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

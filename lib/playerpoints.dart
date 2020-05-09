import 'package:canta_cuvantul/main.dart';
import 'package:canta_cuvantul/playerspage.dart';
import 'package:canta_cuvantul/wordspage.dart';
import 'package:flutter/material.dart';
import 'backgroundGradient.dart';
import 'wordIndex.dart';
import 'Backend/Database_model.dart';
import 'users.dart';
import 'sizehelpers.dart';

WordIndex wordInd = WordIndex();

class PlayerPoints extends StatefulWidget {
  @override
  _PlayerPointsState createState() => _PlayerPointsState();
}

class _PlayerPointsState extends State<PlayerPoints> {
  User userLoad = User();
  List<User> users = [];
  loadUser() async {
    SharedPref sharedPref = SharedPref();
    for (int i = 0; i < counter; i++) {
      users.add(User.fromJson(await sharedPref.read("$i")));
      print(users[i].name);
      print(users[i].points);
    }
  }

  @override
  void initState() {
    loadUser();
    super.initState();
  }

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
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (_, int position) {
                                //  final item = snapshot.data[position];
                                //get your item data here ...
                                return Card(
                                  child: ListTile(
                                    title: Text(snapshot.data[position].row[1]),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: counter,
                              itemBuilder: (_, int index) {
                                //  final item = snapshot.data[position];
                                //get your item data here ...
                                return Card(
                                  shadowColor: Colors.black,
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Text(users[index].name),
                                    subtitle:
                                        Text('Puncte: ${users[index].points}'),
                                  ),
                                );
                              },
                            ),
                          ),
                          FlatButton(
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
                                          fontFamily: 'Josefin',
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
                                        child:
                                            Text("Inapoi la pagina principala"),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            child: Text('Next word'),
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

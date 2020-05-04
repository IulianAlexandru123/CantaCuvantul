import 'package:canta_cuvantul/backgroundGradient.dart';
import 'package:canta_cuvantul/wordspage.dart';
import 'package:flutter/material.dart';
import 'brainplayersgrid.dart';

BrainPlayer _brainPlayer = BrainPlayer();

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  List<String> playersName = [];

  // bool _validate = false;
  List<bool> _validate = [false, false, false, false, false, false];
  List<bool> _setImagestate = [true, true, true, true, true, true];
  List<String> _setImage = ['', '', '', '', '', ''];
  int myIndex = 0;
  bool isDisabled() {
    if (_validate[myIndex] == false || _setImagestate[myIndex] == true)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple,
      body: Stack(
        children: <Widget>[
          BackgroundGradient(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
                child: Text(
                  'Introduceti numele jucatorilor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Josefin',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(1),
                        offset: Offset(0.75, 2),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                  crossAxisSpacing: 45,
                  physics: new NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(6, (index) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: Visibility(
                          visible: _brainPlayer.card[index],
                          child: Container(
                            //  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new TextField(
                                  textAlign: TextAlign.center,
                                  //controller: _text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Josefin',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Nume Jucator',
                                    contentPadding: EdgeInsets.all(0),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.white30,
                                    ),
                                    errorText: _validate[index]
                                        ? 'Minim 2 caractere'
                                        : null,
                                  ),
                                  onSubmitted: (String str) {
                                    setState(() {
                                      str.length <= 2
                                          ? _validate[index] = true
                                          : _validate[index] = false;
                                      playersName.add(str);
                                    });
                                  },
                                ),
                                Visibility(
                                  visible: _setImagestate[index],
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: 80,
                                      color: Colors.lightGreenAccent,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10),
                                            title: Text(
                                              'Alege caracterul',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Josefin',
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            backgroundColor: Colors.blueGrey,
                                            content: Container(
                                              color: Colors.blueGrey,
                                              width: 90,
                                              height: 90,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  FlatButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _setImagestate[index] =
                                                            false;
                                                        _setImage[index] =
                                                            'assets/bitmoji1.png';
                                                      });
                                                    },
                                                    child: Image.asset(
                                                      'assets/bitmoji1.png',
                                                      width: 80,
                                                      height: 80,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 100,
                                                    width: 3,
                                                    color: Colors.white,
                                                  ),
                                                  FlatButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _setImagestate[index] =
                                                            false;
                                                        _setImage[index] =
                                                            'assets/bitmoji2.png';
                                                      });
                                                    },
                                                    child: Image.asset(
                                                      'assets/bitmoji2.png',
                                                      width: 80,
                                                      height: 80,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Image.asset(
                                  _setImage[index],
                                  width: 70,
                                  height: 70,
                                ),
                              ],
                            ),
                            color: Color(0xFF252525),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      color: Color(0xFFCB6100),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontFamily: 'Josefin',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _brainPlayer.resetPos();
                      },
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      child: Text(
                        "Adauga jucator nou",
                        style: TextStyle(
                          fontFamily: 'Josefin',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      disabledColor: Colors.grey,
                      onPressed: () {
                        setState(() {
                          myIndex++;
                          _brainPlayer.checkPos();
                        });
                      },
                    ),
                    RaisedButton(
                      color: Color(0xFF558B2F),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontFamily: 'Josefin',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WordsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

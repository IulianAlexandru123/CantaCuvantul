import 'package:overlay_support/overlay_support.dart';
import 'package:canta_cuvantul/backgroundGradient.dart';
import 'package:canta_cuvantul/users.dart';
import 'package:canta_cuvantul/wordspage.dart';
import 'package:flutter/material.dart';

import 'brainplayersgrid.dart';

double ispressed1 = 0;
double ispressed2 = 0;
BrainPlayer _brainPlayer = BrainPlayer();
int counter = 0;
String nume, caracter = '';
List<bool> _validate = [false, false, false, false, false, false];
List<Color> colors = [
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent
];
List<User> useri = [];

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        home: Scaffold(
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
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.05,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (_, int index) {
                        useri.add(
                          User(name: '', caracter: '', points: 0),
                        );
                        return Card(
                          shadowColor: Colors.transparent,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 1.5,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color(0xFF252525),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: colors[index],
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Visibility(
                                visible: colors[index] == Colors.transparent
                                    ? true
                                    : false,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Color(0xFF558B2F),
                                    size: 70,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                            builder: (context, setState) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    Colors.blueGrey,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                title: Text(
                                                  'Alege caracterul si numele',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Josefin',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          RaisedButton(
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor:
                                                                Colors.black,
                                                            color: Colors
                                                                .transparent,
                                                            elevation:
                                                                ispressed1,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0)),
                                                            onPressed: () {
                                                              setState(() {
                                                                ispressed2 = 0;
                                                                ispressed1 =
                                                                    0.5;
                                                                caracter =
                                                                    'assets/bitmoji1.png';
                                                              });
                                                            },
                                                            child: Image.asset(
                                                              'assets/bitmoji1.png',
                                                              width: 90,
                                                              height: 90,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          RaisedButton(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0)),
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor:
                                                                Colors.black,
                                                            color: Colors
                                                                .transparent,
                                                            elevation:
                                                                ispressed2,
                                                            onPressed: () {
                                                              setState(() {
                                                                ispressed1 = 0;
                                                                ispressed2 =
                                                                    0.5;
                                                                caracter =
                                                                    'assets/bitmoji2.png';
                                                              });
                                                            },
                                                            child: Image.asset(
                                                              'assets/bitmoji2.png',
                                                              width: 90,
                                                              height: 90,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontFamily: 'Josefin',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Nume Jucator',
                                                        contentPadding:
                                                            EdgeInsets.all(0),
                                                        fillColor: Colors.white,
                                                        border:
                                                            InputBorder.none,
                                                        hintStyle: TextStyle(
                                                          color: Colors.white30,
                                                        ),
                                                        errorText: _validate[
                                                                index]
                                                            ? 'Minim 2 caractere'
                                                            : null,
                                                      ),
                                                      onChanged: (str) {
                                                        setState(() {
                                                          str.length <= 2
                                                              ? _validate[
                                                                  index] = true
                                                              : _validate[
                                                                      index] =
                                                                  false;
                                                          nume = str;
                                                        });
                                                      },
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        RaisedButton(
                                                            child:
                                                                Text("Delete"),
                                                            color: Colors.red,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      18.0),
                                                            ),
                                                            onPressed: () {
                                                              ispressed2 = 0;
                                                              ispressed1 = 0;
                                                              nume = '';
                                                              caracter = '';
                                                              Navigator.pop(
                                                                  context);
                                                            }),
                                                        RaisedButton(
                                                          child: Text(
                                                              "Add player"),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    18.0),
                                                          ),
                                                          color: Colors.green,
                                                          onPressed: () {
                                                            if (caracter !=
                                                                    '' &&
                                                                nume.length >=
                                                                    2) {
                                                              setState(() {
                                                                ispressed2 = 0;
                                                                ispressed1 = 0;
                                                                colors[index] =
                                                                    Color(
                                                                        0xFF252525);
                                                                useri[index]
                                                                        .name =
                                                                    nume;
                                                                useri[index]
                                                                        .caracter =
                                                                    caracter;
                                                                // nume = '';
                                                                //  caracter = '';
                                                                counter++;
                                                                caracter = '';
                                                                nume = '';
                                                                refresh();
                                                              });
                                                              Navigator.pop(
                                                                  context,
                                                                  null);
                                                            } else {
                                                              showSimpleNotification(
                                                                  Text(
                                                                      "ATENTIE! Nu ai ales caracterul sau numele nu are cel putin 2 caractere"),
                                                                  background:
                                                                      Colors
                                                                          .red);
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        });
                                  },
                                ),
                              ),
                              Visibility(
                                visible: colors[index] != Colors.transparent
                                    ? true
                                    : false,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        useri[index].name,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Josefin',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Divider(color: Colors.transparent),
                                    Flexible(
                                      flex: 2,
                                      child: Image.asset(useri[index].caracter),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
                            _validate = [
                              false,
                              false,
                              false,
                              false,
                              false,
                              false
                            ];
                            useri = [];
                            colors = [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent
                            ];
                            Navigator.pop(context);
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
                              MaterialPageRoute(
                                  builder: (context) => WordsPage()),
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
        ),
      ),
    );
  }
}

/*
Navigator.of(context)
                                                              .overlay
                                                              .insert(OverlayEntry(
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                            return FunkyNotification();
                                                          }));
*/
class FunkyNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyNotificationState();
}

class FunkyNotificationState extends State<FunkyNotification>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> position;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    position = Tween<Offset>(begin: Offset(0.0, -4.0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.bounceInOut));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 27.0),
            child: SlideTransition(
              position: position,
              child: Container(
                decoration: ShapeDecoration(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0))),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Atentie! Nu ai ales un caracter sau numele nu are minim 2 caractere.',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                  crossAxisSpacing: 45,
                  // physics: new NeverScrollableScrollPhysics(),
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
                        child: Opacity(
                          opacity: _brainPlayer.card[index] ? 1 : 0.5,
                          child: Container(
                            //  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Visibility(
                                  visible: _brainPlayer.card[index],
                                  child: new TextField(
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
                                    onChanged: (String str) {
                                      setState(() {
                                        useri[index].name = str;
                                      });
                                    },

                                    onSubmitted: (String str) {
                                      //if (_submited[index] == false) {
                                      setState(() {
                                        str.length <= 2
                                            ? _validate[index] = true
                                            : _validate[index] = false;
                                        /*  userSave.name = str;
                                        userSave.points = 0;
                                        userSave.caracter = _setImage[index];
                                        print(userSave.caracter);
                                        sharedPref.save("$index", userSave);
                                        counter++;
                                        print(index);
                                        */

                                        useri.add(User(
                                            name: str,
                                            points: 0,
                                            caracter: _setImage[index]));
                                        //     _submited[index] = true;
                                      });
                                      // } else {
                                      // userBrain.changeUser(str, index);
                                      //  }
                                    },
                                  ),
                                ),
                                Visibility(
                                  visible: _setImagestate[index],
                                  child: Visibility(
                                    visible: _brainPlayer.card[index],
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
                                                          _setImagestate[
                                                              index] = false;
                                                          _setImage[index] =
                                                              'assets/bitmoji1.png';
                                                          useri[index]
                                                                  .caracter =
                                                              _setImage[index];
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
                                                          _setImagestate[
                                                              index] = false;
                                                          _setImage[index] =
                                                              'assets/bitmoji2.png';
                                                          useri[index]
                                                                  .caracter =
                                                              _setImage[index];
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

*/
/*    RaisedButton(
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
                    ),*/
/*// bool _validate = false;
  List<bool> _validate = [false, false, false, false, false, false];
  //List<bool> _submited = [false, false, false, false, false, false];
  List<bool> _setImagestate = [true, true, true, true, true, true];
  List<String> _setImage = ['', '', '', '', '', ''];
  //int myIndex = 0;
  bool isDisabled() {
    if (_validate[myIndex] == false || _setImagestate[myIndex] == true)
      return true;
    else
      return false;
  }*/

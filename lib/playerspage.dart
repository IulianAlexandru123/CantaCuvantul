import 'package:flutter/gestures.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:canta_cuvantul/backgroundGradient.dart';
import 'package:canta_cuvantul/users.dart';
import 'package:canta_cuvantul/wordspage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';

int counter = 0;
double visible = 0;
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
                                        barrierDismissible: false,
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
                                                      height: 120,
                                                      width: 300,
                                                      child: Swiper(
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Characters(
                                                            character:
                                                                'assets/boy$index.png',
                                                          );
                                                        },
                                                        itemCount: 4,
                                                        onIndexChanged:
                                                            (int index) {
                                                          visible = 1;
                                                          setState(() => caracter =
                                                              'assets/boy$index.png');
                                                        },
                                                        viewportFraction: 0.6,
                                                        scale: 0.7,
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
                                                                    'assets/boy0.png' &&
                                                                caracter !=
                                                                    '' &&
                                                                nume.length >=
                                                                    2) {
                                                              setState(() {
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
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
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
                            counter = 0;
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
                            if (counter < 2) {
                              showSimpleNotification(
                                  Text("Adauga minim 2 jucatori!"),
                                  background: Colors.red);
                            } else {
                              _validate = [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ];
                              colors = [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent
                              ];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WordsPage()),
                              );
                            }
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

class Characters extends StatefulWidget {
  final String character;

  const Characters({
    this.character,
    Key key,
  }) : super(key: key);

  @override
  _CharactersState createState() => _CharactersState();
}

class _CharactersState extends State<Characters> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.keyboard_arrow_left),
          Image.asset(
            widget.character,
            width: 90,
            height: 90,
          ),
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}

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

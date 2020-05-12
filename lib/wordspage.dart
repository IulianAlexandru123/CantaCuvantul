import 'wordIndex.dart';
import 'package:canta_cuvantul/playerpoints.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'popup_menu.dart';
import 'Backend/Database_model.dart';
import 'package:flutter/material.dart';
import 'backgroundGradient.dart';

import 'dart:async';

WordIndex wordIndex = WordIndex();
int timeRemaining = 30;

class WordsPage extends StatefulWidget {
  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  PopupMenu menu;

  GlobalKey btnKey = GlobalKey();
  String artist = '';
  String year = '';
  int _current;
  void stateChanged(bool isShow) {
    print('menu is ${isShow ? 'showing' : 'closed'}');
  }

  var isVisible1 = false;
  var isVisible2 = false;
  void onClickMenu(MenuItemProvider item) {
    print('Click menu -> ${item.menuTitle}');
    if (item.menuTitle == 'An lansare')
      setState(() {
        isVisible1 = true;
      });
    if (item.menuTitle == 'Artist')
      setState(() {
        isVisible2 = true;
      });
  }

  void onDismiss() {
    print('Menu is dismiss');
  }

  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;
    _current = wordIndex.getCounter();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<List>(
        future: Word().runQuery(wordIndex.getRmd(), true),
        initialData: List(),
        builder: (context, snapshot) {
          //var post = snapshot.data[0].row[2];
          //  int lung = post.length;
          artist = snapshot.data[1].row[2];
          year = snapshot.data[1].row[3].toString();
          if (snapshot.hasData) {
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  BackgroundGradientBlue(),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '100',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset('assets/coin.svg'),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            'Runda $_current',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Josefin',
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Cuvantul este:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Josefin',
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 28,
                              ),
                            ),
                            Divider(
                              color: Colors.transparent,
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Text(
                                snapshot.data[0].row[1],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Josefin',
                                  color: Colors.red[600],
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 200,
                                height: 200,
                                child: CustomPaint(
                                  painter: CirclePainter(),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  CntTimer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Visibility(
                              visible: isVisible1,
                              child: Text(
                                'Anul aparitiei: ' + year,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Josefin',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isVisible2,
                              child: Text(
                                'Artistul: ' + artist,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Josefin',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                key: btnKey,
                                onTap: () {
                                  maxColumn();
                                },
                                child: Column(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/icons8-music.svg',
                                      height: 50,
                                    ),
                                    Text(
                                      'Hints',
                                      style: TextStyle(
                                        fontFamily: 'Josefin',
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      timeRemaining += 10;
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons8_time_1px_3.svg',
                                      height: 50,
                                    ),
                                  ),
                                  Text(
                                    '+10 seconds',
                                    //  textAlign: TextAlign.center,

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Josefin',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void maxColumn() {
    PopupMenu menu = PopupMenu(
        backgroundColor: Colors.black54,
        lineColor: Colors.tealAccent,
        maxColumn: 1,
        items: [
          MenuItem(
            title: 'An lansare',
            //  image: Image.asset('assets/copy.png'),
          ),
          MenuItem(
            title: 'Artist',
            image: Icon(
              Icons.verified_user,
              color: Colors.white,
            ),
          ),
          MenuItem(
            title: '5 seconds',
            userInfo: Text('da'),
            image: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ],
        onClickMenu: onClickMenu,
        stateChanged: stateChanged,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey);
  }
}

class CirclePainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.orange
    ..strokeWidth = 10
    // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CntTimer extends StatefulWidget {
  @override
  CntTimerState createState() => CntTimerState();
}

class CntTimerState extends State<CntTimer> {
  var colorCurrent = Colors.white;

  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _getTime();
      if (timeRemaining == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlayerPoints()));
      }
    });
    super.initState();
  }

  void _getTime() {
    setState(() {
      timeRemaining == 0 ? timeRemaining = 0 : timeRemaining--;
    });
  }

  @override
  void dispose() {
    timeRemaining = 30;
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (timeRemaining == 0) dispose();
    if (timeRemaining <= 3) colorCurrent = Colors.red;
    return Column(
      children: <Widget>[
        Text(
          '$timeRemaining',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorCurrent,
            fontFamily: 'Rubik',
            fontSize: 80,
          ),
        ),
        FlatButton(
          //  elevation: 0,
          //  highlightColor: Colors.transparent,
          color: Colors.transparent,
          onPressed: () {
            setState(() {
              timer.cancel();
              timeRemaining = 30;
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayerPoints()),
            );
          },
          child: Text(
            'Press for next',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Josefin',
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        )
      ],
    );
  }
}

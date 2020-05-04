import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';

import 'Backend/Database_model.dart';
import 'package:flutter/material.dart';
import 'backgroundGradient.dart';
import 'package:quiver/async.dart';

class WordsPage extends StatefulWidget {
  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  int rmd = Random().nextInt(3) + 1;
  int _counter = 1;
  String artist = '???';
  String year = '???';
  int current = 30;
  int start = 30;
  int pressed = 0;
  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      Duration(seconds: start),
      Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        current = start - duration.elapsed.inSeconds;
      });
    });
    sub.onDone(() {
      print("Done");
      setState(() {
        resetTimer();
      });
    });
  }

  void resetTimer() {
    start = 30;
    current = 30;
    startTimer();
  }

  void moreSeconds() {
    setState(() {
      current += 10;
      start += 10;
    });
  }

  /* int _getRandom() {
  rmd = Random().nextInt(3) + 1;
    return rmd;
  }
*/
  void _counterIncrease() {
    if (_isFinied() == true)
      _counter++;
    else
      _restartGame();
  }

  void _restartGame() {
    _counter = 1;
  }

  bool _isFinied() {
    if (_counter < 10)
      return true;
    else
      return false;
  }

  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<List>(
        future: Word().runQuery(rmd),
        initialData: List(),
        builder: (context, snapshot) {
          var post = snapshot.data[0].row[2];
          int lung = post.length;
          if (snapshot.hasData) {
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  BackgroundGradientBlue(),
                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            'Runda $_counter',
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
                          padding: const EdgeInsets.only(bottom: 100),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    '$current',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Rubik',
                                      fontSize: 80,
                                    ),
                                  ),
                                  FlatButton(
                                    //  elevation: 0,
                                    //  highlightColor: Colors.transparent,
                                    color: Colors.transparent,
                                    onPressed: null,
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
                              ),
                              SizedBox(
                                width: 200,
                                height: 200,
                                child: CustomPaint(
                                  painter: CirclePainter(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons8-music.svg',
                                      height: 50,
                                    ),
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
                              Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {},
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

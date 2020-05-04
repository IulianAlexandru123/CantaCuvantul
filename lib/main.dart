import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'playerspage.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'backgroundGradient.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.transparent,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0),
              ),
              child: Container(
                color: Color(0xFFF5A307),
                child: ListView(
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      alignment: Alignment.topLeft,
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text(
                        'Cum se joaca?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Josefin',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          BackgroundGradient(),
          SvgPicture.asset('assets/StartPage.svg'),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    iconSize: 35,
                    //   padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                  Row(
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
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(52, 110, 53, 0),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        // top: 7,
                        right: 60,
                        left: 55,
                        child: Text(
                          'Canta',
                          style: TextStyle(
                            fontFamily: 'Vibur',
                            fontSize: 52,
                            color: Colors.blue[400],
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(1),
                                offset: Offset(0.75, 1),
                                blurRadius: 7.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Cuvantul',
                        style: TextStyle(
                          fontFamily: 'Vibur',
                          fontSize: 96,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.8),
                              offset: Offset(0.75, 2),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                  child: Container(
                    width: 142,
                    height: 142,
                    child: FittedBox(
                      child: CircularGradientButton(
                        child: Text(
                          'Start',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Josefin',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerPage()),
                          );
                        },
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            0,
                            0.5,
                            1,
                          ],
                          colors: [
                            Color(0xFFFC4850),
                            Color(0xFFFC4850),
                            Color(0xFFFF7B36),
                          ],
                        ),
                        shadowColor:
                            Gradients.deepSpace.colors.last.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

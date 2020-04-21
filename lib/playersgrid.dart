import 'package:flutter/material.dart';

class PlayersGrid extends StatefulWidget {
  @override
  _PlayersGridState createState() => _PlayersGridState();
}

class _PlayersGridState extends State<PlayersGrid> {
  Color _color = Color(0xFF252525);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
        crossAxisSpacing: 45,
        physics: new NeverScrollableScrollPhysics(),
        childAspectRatio: 0.8,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                    icon: Icon(
                      Icons.add,
                      size: 60,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  const Text(
                    'Player #1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Josefin',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              color: Color(0xFF252525),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 130, 10, 10),
              child: const Text(
                'Player #2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Josefin',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Color(0xFF252525),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 130, 10, 10),
              child: const Text(
                'Player #3',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Josefin',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Color(0xFF252525),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 130, 10, 10),
              child: const Text(
                'Player #4',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Josefin',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Color(0xFF252525),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 130, 10, 10),
              child: const Text(
                'Player #5',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Josefin',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Color(0xFF252525),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 130, 10, 10),
              child: const Text(
                'Player #6',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Josefin',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: _color,
            ),
          ),
        ],
      ),
    );
  }
}

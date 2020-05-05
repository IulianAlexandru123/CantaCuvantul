import 'package:flutter/material.dart';
import 'backgroundGradient.dart';

class PlayerPoints extends StatefulWidget {
  @override
  _PlayerPointsState createState() => _PlayerPointsState();
}

class _PlayerPointsState extends State<PlayerPoints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        BackgroundGradientBlue(),
      ],
    ));
  }
}

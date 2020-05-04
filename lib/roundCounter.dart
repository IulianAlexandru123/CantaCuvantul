import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class Timer extends StatefulWidget {
  final Function function;
  Timer({Key key, this.function}) : super(key: key);
  @override
  TimerState createState() => TimerState();
}

class TimerState extends State<Timer> {
  int current = 30;
  int start = 30;

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        current = start - duration.elapsed.inSeconds;
      });
    });
    void reset() {
      start = 30;
      current = 30;
    }

    sub.onDone(() {
      print("Done");
      setState(() {
        reset();
      });
    });
  }

  void moreSeconds() {
    setState(() {
      current += 10;
      start += 10;
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$current',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Rubik',
          fontSize: 40,
        ),
      ),
    );
  }
}

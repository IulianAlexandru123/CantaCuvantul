import 'dart:math';

int _rmd = Random().nextInt(3);
int _counter = 1;

class WordIndex {
  WordIndex();
  void generateRandom() {
    _rmd = Random().nextInt(3);
  }

  void counterIncrease() {
    _counter++;
  }

  bool isOk() {
    if (_counter < 10)
      return true;
    else
      return false;
  }

  int getRmd() {
    //  print(_rmd);
    return _rmd;
  }

  int getCounter() {
    return _counter;
  }
}

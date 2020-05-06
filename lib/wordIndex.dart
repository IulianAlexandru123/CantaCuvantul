import 'dart:math';

int _rmd = Random().nextInt(3) + 1;
int _counter = 1;

class WordIndex {
  WordIndex() {}
  void generateRandom() {
    _rmd = Random().nextInt(3) + 1;
  }

  void counterIncrease() {
    _counter++;
  }

  int getRmd() {
    //  print(_rmd);
    return _rmd;
  }

  int getCounter() {
    return _counter;
  }
}

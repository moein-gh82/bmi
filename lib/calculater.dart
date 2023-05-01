import 'dart:math';

class Calculator {
  late final int? height;
  late final int? weight;
  double _bmi = 0;

  Calculator({required this.height, required this.weight});
  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String gerInterpretation() {
    if (_bmi >= 25) {
      return ('you have a higher than normal body weight. try to exercise more.');
    } else if (_bmi >= 18) {
      return ('you have a normal body weight. good job!');
    } else {
      return ('you have a lower than normal body weight. you can eat a bit more.');
    }
  }

  String getresult() {
    if (_bmi >= 25) {
      return ('over weight');
    } else if (_bmi >= 18) {
      return ('normal');
    } else {
      return ('underweight');
    }
  }
}

import 'dart:math';

import 'package:flutter/widgets.dart';

class Calculation {
  final int height;
  final int weight;
  double _bmi;
  Calculation({@required this.height, @required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getResultDetail() {
    if (_bmi >= 25) {
      return 'You have higher body weight than normal body weight. Try to excercise more.';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight. Keep it up!';
    } else {
      return 'You have lower body weight than normal body weight. Try to eat a bit more.';
    }
  }
}

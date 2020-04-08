import 'dart:math';

class CalculateBMI {
  double invoke(double height, double weight) {
    return (weight / pow(height/100,2));
  }

  String getResult(double bmi) {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else
      return 'Underweight';
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return 'Yo should be eating less';
    } else if (bmi > 18.5) {
      return 'You are normal, keep up the good work';
    } else
      return 'Try and eat something dude, you are going to die';
  }
}
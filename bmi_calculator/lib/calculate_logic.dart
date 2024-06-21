import 'dart:math';

class CalculateLogic {
  CalculateLogic({
    required this.height,
    required this.weight,
    required this.age,
    required this.sex,
  });

  final int height;
  final int weight;
  final int age;
  final String sex;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    // Adjust BMI based on sex
    if (sex == 'male') {
      _bmi *= 1.1; // Example adjustment for males
    } else if (sex == 'female') {
      _bmi *= 0.9; // Example adjustment for females
    }
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

  String getResultMessage() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more and eat low-carb meals.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Congratulations. But always have checkups with your doctor.';
    } else {
      return 'You have a lower than normal body weight. Try to eat foods with more carbohydrates and proteins.';
    }
  }
}

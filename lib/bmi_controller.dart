class BMIcalculator {
  final double weight;
  final double height;

  BMIcalculator({required this.weight, required this.height});

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / ((height / 100) * (height / 100));
    return _bmi.toStringAsFixed(0);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return "Underweight";
    }
  }
}

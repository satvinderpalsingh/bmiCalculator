import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'calculatorBrain.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  //const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
    );
  }
}

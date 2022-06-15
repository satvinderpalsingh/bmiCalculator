import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/bottomButton.dart';

class ResultPage extends StatelessWidget {
  //const ResultPage({Key? key}) : super(key: key);

  final String bmi;
  final String bmiResult;
  final String bmiInterpretation;
  ResultPage(
      {required this.bmi,
      required this.bmiInterpretation,
      required this.bmiResult});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: const Center(
              child: Text(
                "Your Result",
                style: kResultTitleStyle,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: const Color(activeColor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      bmiInterpretation,
                      style: kBMIBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              buttonOnTap: () {
                Navigator.pop(context);
              },
              buttonTitle: "RE-Calculate")
        ],
      ),
    );
  }
}

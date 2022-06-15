import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/cardChildComponent.dart';
import '../constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import '../components/bottomButton.dart';
import 'package:bmi_calculator/components/roundIcon.dart';
import 'package:bmi_calculator/calculatorBrain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int heightValue = 180;
  int weightValue = 70;
  int ageValue = 12;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'BMI Calculator',
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      currentState: () {
                        setState(() {
                          selectedGender = selectedGender == Gender.male
                              ? null
                              : Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? const Color(activeColor)
                          : const Color(inActiveColor),
                      cardChild: CardChildComponent(
                        gender: "Male",
                        cardIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      currentState: () {
                        setState(() {
                          selectedGender = selectedGender == Gender.female
                              ? null
                              : Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? const Color(activeColor)
                          : const Color(inActiveColor),
                      cardChild: CardChildComponent(
                        gender: "Female",
                        cardIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: const Color(activeColor),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: kLabelledText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          heightValue.toString(),
                          style: kNumberedStyle,
                        ),
                        const Text(
                          "cm",
                          style: kLabelledText,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayColor: const Color(0x29EB1555),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          min: 0,
                          max: 300,
                          value: heightValue.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              heightValue = value.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Weight",
                            style: kLabelledText,
                          ),
                          Text(
                            weightValue.toString(),
                            style: kNumberedStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                buttonChild: FontAwesomeIcons.plus,
                                buttonPressed: () {
                                  setState(() {
                                    weightValue += 1;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                buttonChild: FontAwesomeIcons.minus,
                                buttonPressed: () {
                                  setState(() {
                                    weightValue -= 1;
                                    weightValue =
                                        weightValue < 0 ? 0 : weightValue;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      colour: const Color(activeColor),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: const Color(activeColor),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style: kLabelledText,
                          ),
                          Text(
                            ageValue.toString(),
                            style: kNumberedStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                buttonChild: FontAwesomeIcons.plus,
                                buttonPressed: () {
                                  setState(() {
                                    ageValue += 1;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                buttonChild: FontAwesomeIcons.minus,
                                buttonPressed: () {
                                  setState(() {
                                    ageValue -= 1;
                                    ageValue = ageValue < 0 ? 0 : ageValue;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                buttonOnTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: heightValue, weight: weightValue);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                          bmi: calc.calculateBmi(),
                          bmiInterpretation: calc.getInterpretation(),
                          bmiResult: calc.getResult()),
                    ),
                  );
                },
                buttonTitle: "Calculate")
          ],
        ),
      ),
    );
  }
}

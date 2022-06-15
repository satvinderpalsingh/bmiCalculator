import 'package:flutter/material.dart';
import '../constants.dart';

class CardChildComponent extends StatelessWidget {
  final List<MainAxisAlignment> mainAxisData = [
    MainAxisAlignment.center,
    MainAxisAlignment.spaceBetween
  ];
  final String gender;
  final IconData? cardIcon;

  CardChildComponent({required this.gender, this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(gender, style: kLabelledText)
      ],
    );
  }
}

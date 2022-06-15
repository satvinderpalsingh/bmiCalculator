import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback buttonOnTap;
  final String buttonTitle;
  BottomButton({required this.buttonOnTap, required this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonOnTap,
      child: Container(
        color: const Color(bottomColor),
        width: double.infinity,
        height: bottomBarHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeFontTextStyle,
          ),
        ),
      ),
    );
  }
}

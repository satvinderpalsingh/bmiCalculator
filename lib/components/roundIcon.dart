import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  IconData buttonChild;
  VoidCallback buttonPressed;

  RoundIconButton({required this.buttonChild, required this.buttonPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: buttonPressed,
        shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
        constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
        elevation: 6.0,
        child: Icon(buttonChild));
  }
}

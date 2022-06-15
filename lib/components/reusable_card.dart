import 'package:flutter/material.dart';

const double cardMargin = 15;
const double cardBorderRadius = 10;

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? currentState;

  ReusableCard({required this.colour, this.cardChild, this.currentState});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: currentState,
      child: Container(
        margin: const EdgeInsets.all(cardMargin),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(cardBorderRadius),
        ),
        child: cardChild,
      ),
    );
  }
}

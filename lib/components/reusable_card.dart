import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.colours, required this.cardChild,});

  final Color colours;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: colours,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: cardChild
      ),
    );
  }
}
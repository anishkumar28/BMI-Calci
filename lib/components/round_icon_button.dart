import 'package:flutter/material.dart';



class RoundIconButton extends StatelessWidget {

  const RoundIconButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 54.0,
        height: 54.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onTap,
      child: Icon(icon),
    );
  }
}

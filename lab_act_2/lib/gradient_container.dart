import 'package:flutter/material.dart';
import 'package:lab_act_2/dice_roller.dart';
import 'styled_text.dart';


class GradientContainer extends StatelessWidget {
GradientContainer({super.key});


  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.red],
        ),
      ),
      child: Center(
        child: DiceRoller()
        ),
    );
  }
}
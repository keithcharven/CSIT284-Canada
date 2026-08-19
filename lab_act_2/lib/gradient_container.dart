import 'package:flutter/material.dart';
import 'styled_text.dart';


class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
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
      child: Center(child: 
        StyledText(),
        ),
    );
  }
}
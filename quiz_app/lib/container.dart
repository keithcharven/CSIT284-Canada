import 'package:flutter/material.dart';
import 'color_randomizer.dart'; 

class QuizContainer extends StatelessWidget { 
  const QuizContainer({super.key});

  @override
  Widget build(context){
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors:[
            Color.fromARGB(255, 112, 81, 148), 
            Color.fromARGB(255, 63, 21, 107),   
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 320,
            ),
            const SizedBox(height: 80,),
            const ColorChange(), 
          ],
        ),
      ),
    );
  }
}
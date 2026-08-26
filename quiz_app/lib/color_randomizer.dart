import 'package:flutter/material.dart';
import 'dart:math';

class ColorChange extends StatefulWidget {
  const ColorChange({super.key});

  @override
  State<ColorChange> createState() => _ColorChangeState();
}

class _ColorChangeState extends State<ColorChange> {
  Color myTextColor = Colors.white; 
  final random = Random();
  var colors = [Colors.red,Colors.blue,Colors.yellow,Colors.green,Colors.orange,Colors.purple];
  int select = 0;

  void container() {
    setState(() {
      select = random.nextInt(colors.length);
      myTextColor = colors[select]; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:[
        Text('Learn Flutter the fun way!',style: TextStyle(color: myTextColor,fontSize: 24,),),
        const SizedBox(height: 30,),
        TextButton(
          onPressed: container,
          child: const Text(
            'Start Quiz',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ),
      ],
    );
  }
}
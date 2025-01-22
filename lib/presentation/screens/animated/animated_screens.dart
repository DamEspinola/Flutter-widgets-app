import "dart:math" show Random;
import 'package:flutter/material.dart';

class AnimatedScreens extends StatefulWidget {
  const AnimatedScreens({super.key});

  @override
  State<AnimatedScreens> createState() => _AnimatedScreensState();

}


class _AnimatedScreensState extends State<AnimatedScreens> {

  double width = 50;
double height = 50;
Color color = Colors.deepPurple;
double borderRadius = 10.0;

void changeShape(){

final random = Random();

width = random.nextInt(300) + 120;
height = random.nextInt(300) + 120;
color = Color.fromRGBO(
  random.nextInt(256),
  random.nextInt(256),
  random.nextInt(256),
  1,
);
borderRadius = random.nextInt(100).toDouble();

setState(() {
  
});

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated screens'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
           curve: Curves.easeInOutCubic,
           width: width <= 0 ? 0 : width,
            height: height <= 0 ? 0 : height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
            )
            ),
        ),
      floatingActionButton:
          FloatingActionButton(onPressed: changeShape, child: Icon(Icons.play_arrow)),
    );
  }
}

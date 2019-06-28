

import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center( 
        child: AnimatedContainer(
          duration: Duration( seconds: 5 ),
          curve: Curves.bounceIn,
          width: _width,
          height: _height,
          // color: _color,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(_width.toString()),
              ),
              Center(
                child: Text(_height.toString()),
              ),
              Center(
                child: Text(_color.toString()),
              ),
              Center(
                child: Text(_borderRadius.toString()),
              ),
            ],
          ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.play_arrow),
        onPressed: _cambiarForma,
      ),

    );
  }

  void _cambiarForma() {

    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(300), 
          random.nextInt(300), 
          random.nextInt(300), 
          1
        );

      _borderRadius = BorderRadius.circular(random.nextInt(300).toDouble());
    });

  }




}
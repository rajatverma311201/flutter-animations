import 'package:flutter/material.dart';
import 'dart:math';

import './animation_control_buttons.dart';
import './rotation_axis_selector.dart';
import './rotation_info_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Box Rotation Animation',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String axis = "Z";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(_controller);
  }

  Matrix4 _getTransformMatrix() {
    switch (axis) {
      case "X":
        return Matrix4.identity()..rotateX(_animation.value);
      case "Y":
        return Matrix4.identity()..rotateY(_animation.value);
      default:
        return Matrix4.identity()..rotateZ(_animation.value);
    }
  }

  void _selectAxis(String ax) {
    setState(() {
      axis = ax;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Box Rotation Animation'),
      ),
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationInfoText(axis: axis),
            const SizedBox(height: 75),
            AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: _getTransformMatrix(),
                    child: const RotationBox(),
                  );
                }),
            const SizedBox(height: 75),
            AnimationControlButtons(controller: _controller),
            const SizedBox(
              height: 50,
            ),
            RotationAxisSelector(
              onSelect: _selectAxis,
            )
          ],
        ),
      ),
    );
  }
}

class RotationBox extends StatelessWidget {
  const RotationBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 10,
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}

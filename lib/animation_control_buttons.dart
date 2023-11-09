import 'package:flutter/material.dart';

class AnimationControlButtons extends StatelessWidget {
  final AnimationController _controller;

  const AnimationControlButtons({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionBtn(
            color: Colors.green,
            text: "Start",
            onPress: () {
              _controller.repeat();
            }),
        const SizedBox(width: 25),
        ActionBtn(
          color: Colors.red,
          text: "Stop",
          onPress: () {
            _controller.stop();
          },
        ),
      ],
    );
  }
}

class ActionBtn extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPress;

  const ActionBtn({
    super.key,
    required this.color,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // _controller.stop();
        onPress();
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 12.5, horizontal: 30)),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RotationInfoText extends StatelessWidget {
  final String axis;

  const RotationInfoText({
    super.key,
    required this.axis,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Text(
        "Rotation Axis is `$axis`",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

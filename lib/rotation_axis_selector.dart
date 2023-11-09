import 'package:flutter/material.dart';

class RotationAxisSelector extends StatelessWidget {
  final Function onSelect;

  const RotationAxisSelector({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (String ax in ["X", "Y", "Z"])
          Row(
            children: [
              FloatingActionButton(
                onPressed: () {
                  onSelect(ax);
                },
                backgroundColor: Colors.black,
                child: Text(
                  ax,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: ax == "Z" ? 0 : 20,
              )
            ],
          ),
      ],
    );
  }
}

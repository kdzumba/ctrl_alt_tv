import "package:ctrl_alt_tv/widgets/button.dart";
import "package:flutter/material.dart";

class VolumeControlsWidget extends StatelessWidget {
  final VoidCallback onIncreasePressed;
  final VoidCallback onDecreasePressed;

  const VolumeControlsWidget({
    super.key,
    required this.onIncreasePressed,
    required this.onDecreasePressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 32, 35,42),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white30,
          width: 2.0
        )
      ),
      child: Column(
        children: [
          ButtonWidget(icon: Icons.add, onPressed: onIncreasePressed, backgroundColor: Color.fromARGB(255, 32, 35,42),),
          Text("VOL",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          ),
          ButtonWidget(icon: Icons.remove, onPressed: onDecreasePressed, backgroundColor: Color.fromARGB(255, 32, 35,42))
        ],
      ),
    );
  }
}
import "package:ctrl_alt_tv/widgets/button_widget.dart";
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
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          ButtonWidget(icon: Icons.add, onPressed: onIncreasePressed),
          Text("Vol",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          ),
          ButtonWidget(icon: Icons.remove, onPressed: onDecreasePressed)
        ],
      ),
    );
  }
}
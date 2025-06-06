import "package:ctrl_alt_tv/widgets/ctrl_icon_button.dart";
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
        color: Color(0xFF262229),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        children: [
          CtrlIconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: onIncreasePressed
          ),
          Text("VOL",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18
            ),
          ),
          CtrlIconButton(
              icon: Icon(Icons.remove, color: Colors.white),
              onPressed: onDecreasePressed
          )
        ],
      ),
    );
  }
}
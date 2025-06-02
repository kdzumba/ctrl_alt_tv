import "package:ctrl_alt_tv/widgets/ctrl_icon_button.dart";
import "package:flutter/material.dart";

class ChannelControlsWidget extends StatelessWidget {
  final VoidCallback onIncreasePressed;
  final VoidCallback onDecreasePressed;

  const ChannelControlsWidget({
    super.key,
    required this.onIncreasePressed,
    required this.onDecreasePressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFA169D1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CtrlIconButton(
            icon: Icons.add,
            onPressed: onIncreasePressed,
          ),
          Text("CH",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18
            ),
          ),
          CtrlIconButton(
            icon: Icons.remove,
            onPressed: onDecreasePressed,
          )
        ],
      )
    );
  }
}
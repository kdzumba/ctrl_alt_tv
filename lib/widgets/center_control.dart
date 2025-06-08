import "package:ctrl_alt_tv/theme/app_theme.dart";
import "package:flutter/material.dart";
import "../widgets/ctrl_icon_button.dart";

class CenterControlsWidget extends StatelessWidget {
  final VoidCallback onUpPressed;
  final VoidCallback onDownPressed;
  final VoidCallback onLeftPressed;
  final VoidCallback onRightPressed;
  final VoidCallback onSelectPressed;

  final scheme = "http";
  final esp32IP = "192.168.4.1";

  const CenterControlsWidget({
    super.key,
    required this.onUpPressed,
    required this.onDownPressed,
    required this.onLeftPressed,
    required this.onRightPressed,
    required this.onSelectPressed
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 270,
          height: 270,
          decoration: BoxDecoration(
            color: Color(0xFF262229),
            shape: BoxShape.circle,
          ),
        ),
        Positioned(
          top: 2,
          child: CtrlIconButton(
            icon: Icon(Icons.keyboard_arrow_up, color: Colors.white),
            onPressed: onUpPressed,
          ),
        ),
        Positioned(
          bottom: 2,
          child: CtrlIconButton(
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            onPressed: onDownPressed,
          ),
        ),
        Positioned(
          left: 2,
          child: CtrlIconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            onPressed: onLeftPressed,
          ),
        ),
        Positioned(
          right: 2,
          child: CtrlIconButton(
            icon: Icon(Icons.keyboard_arrow_right, color: Colors.white),
            onPressed: onRightPressed,
          ),
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: ElevatedButton(
            onPressed: onSelectPressed,
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(30),
              backgroundColor: AppTheme.primaryBackgroundColor,
            ),
            child: Text("OK", style: Theme.of(context).textTheme.displayMedium),
          ),
        ),
      ],
    );
  }
}

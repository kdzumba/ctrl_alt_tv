import "package:ctrl_alt_tv/widgets/ctrl_button_base.dart";
import "package:flutter/material.dart";

class CtrlIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BoxShape? shape;
  final Color? iconColor;
  final double iconSize;

  const CtrlIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.shape,
    this.iconColor,
    this.iconSize = 24
  });

  @override
  Widget build(BuildContext context) {
    return CtrlButtonBase(
        backgroundColor: backgroundColor ?? const Color(0xFFA169D1),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: iconColor ?? Colors.white),
          iconSize: iconSize,
        )
    );
  }
}
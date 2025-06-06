import "package:ctrl_alt_tv/widgets/ctrl_button_base.dart";
import "package:flutter/material.dart";

class CtrlIconButton extends StatelessWidget {
  final Widget icon;
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
        backgroundColor: backgroundColor ?? const Color(0xFF262229),
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          iconSize: iconSize,
          // border: BoxBorder.
        )
    );
  }
}
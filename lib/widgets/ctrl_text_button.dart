import "package:ctrl_alt_tv/widgets/ctrl_button_base.dart";
import "package:flutter/material.dart";

class CtrlTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;

  const CtrlTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 18
  });

  @override
  Widget build(BuildContext context) {
    return CtrlButtonBase(
        child: TextButton(
            onPressed: onPressed,
            child: Text(
                text,
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize
                )
            )
        )
    );
  }
}
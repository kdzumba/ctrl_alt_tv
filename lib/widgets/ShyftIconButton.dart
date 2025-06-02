import "package:flutter/material.dart";

class CtrlIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;


  const CtrlIconButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon)
    );
  }
}
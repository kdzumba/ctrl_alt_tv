import "package:flutter/material.dart";

class CtrlIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BoxShape? shape;

  const CtrlIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.shape
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFA169D1),
          borderRadius: BorderRadius.circular(12),
          shape: shape ?? BoxShape.rectangle
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.white),
          iconSize: 24,
        )
    );
  }
}
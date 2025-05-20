import "package:flutter/material.dart";

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const ButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: backgroundColor,
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.white),
      )
    );
  }
}
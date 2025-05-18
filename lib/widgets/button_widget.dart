import "package:flutter/material.dart";

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ButtonWidget({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.deepPurple,
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.white),
      )
    );
  }
}
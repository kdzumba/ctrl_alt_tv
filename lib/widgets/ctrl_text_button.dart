import "package:flutter/material.dart";

class CtrlTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  const CtrlTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFA169D1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          )
      )
    );
  }
}
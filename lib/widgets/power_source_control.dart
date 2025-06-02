import "package:flutter/material.dart";

class PowerSourceControlWidget extends StatelessWidget {
  final VoidCallback onPowerPressed;
  final VoidCallback onInputPressed;

  const PowerSourceControlWidget({
    super.key,
    required this.onPowerPressed,
    required this.onInputPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xFFEE5454),
              shape: BoxShape.circle
          ),
          child: IconButton(
              icon: const Icon(Icons.power_settings_new_outlined, color: Colors.white),
              onPressed: onPowerPressed,
              iconSize: 24
          ),
        ),
        Container(
            decoration: BoxDecoration(
                color: Color(0xFF1AA91F),
                shape: BoxShape.circle
            ),
            child: IconButton(
              icon: const Icon(Icons.input, color: Colors.white),
              iconSize: 24,
              onPressed: onInputPressed,
            )
        )
      ]
    );
  }
}
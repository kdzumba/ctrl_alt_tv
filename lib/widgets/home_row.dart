import "package:ctrl_alt_tv/widgets/ctrl_icon_button.dart";
import "package:flutter/material.dart";

class HomeRow extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onHomePressed;
  final VoidCallback onMenuPressed;

  const HomeRow({
    super.key,
    required this.onBackPressed,
    required this.onHomePressed,
    required this.onMenuPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 7,
            ),
            child: CtrlIconButton(
                icon: Icon(Icons.keyboard_backspace, color: Colors.white),
                onPressed: onBackPressed,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 7,
              right: 7
            ),
            child: CtrlIconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: onHomePressed,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 7
            ),
            child: CtrlIconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: onMenuPressed,
            ),
          ),
        )
      ],
    );
  }
}
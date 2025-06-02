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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              child: CtrlIconButton(
                  icon: Icons.keyboard_backspace,
                  onPressed: onBackPressed,
              ),
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              child: CtrlIconButton(
                  icon: Icons.home,
                  onPressed: onHomePressed,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 7
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              child: CtrlIconButton(
                  icon: Icons.menu,
                  onPressed: onMenuPressed,
              ),
            ),
          ),
        )
      ],
    );
  }
}
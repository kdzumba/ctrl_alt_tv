import "package:ctrl_alt_tv/widgets/button.dart";
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
                border: Border.all(
                  width: 2,
                  color: Colors.white30
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: ButtonWidget(
                  icon: Icons.keyboard_backspace,
                  onPressed: onBackPressed,
                  backgroundColor: Color.fromARGB(255, 32, 35, 42)
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
                border: Border.all(
                  width: 2,
                  color: Colors.white30
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: ButtonWidget(
                  icon: Icons.home,
                  onPressed: onHomePressed,
                  backgroundColor: Color.fromARGB(255, 32, 35, 42)
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
                border: Border.all(
                  width: 2,
                  color: Colors.white30
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: ButtonWidget(
                  icon: Icons.menu,
                  onPressed: onMenuPressed,
                  backgroundColor: Color.fromARGB(255, 32, 35, 42)
              ),
            ),
          ),
        )
      ],
    );
  }
}
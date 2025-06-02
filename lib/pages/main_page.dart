import "package:ctrl_alt_tv/widgets/ShyftIconButton.dart";
import "package:flutter/material.dart";

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CtrlIconButton(
              onPressed: () => print("pressed"),
              icon: Icons.add)
        ],
      ),
    );
  }
}
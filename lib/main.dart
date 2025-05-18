import "package:ctrl_alt_tv/pages/home_page.dart";
import "package:flutter/material.dart";

void main() {
  runApp(RemoteControllerApp());
}

class RemoteControllerApp extends StatelessWidget {
  const RemoteControllerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
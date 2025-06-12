import 'dart:math';

import 'package:ctrl_alt_tv/interfaces/keyboard.dart';

class CtrlKeyboardService {
  Future<void> searchNetflix(String query) async {

  }

  String _convertToNetflixSearchCommand(String query) {
    String result = "";
    return result;
  }

  List<String> _generateSearchSequence(String searchString, Keyboard keyboard) {
    List<String> commandSequence = [];

    Map<String, Point> keyboardMap = keyboard.getKeyboards()[0].keyboard;
    Point currentPosition = keyboard.getCurrentPosition();

    for(var char in searchString.toUpperCase().split("")) {
      if(!keyboard.getKeyboards()[0].keyboard.containsKey(char)) {
        continue;
      }

      Point target = keyboardMap[char]!;
      int dx = target.x.toInt() - currentPosition.x.toInt();
      int dy = target.y.toInt() - currentPosition.y.toInt();

      if(dy < 0) commandSequence.addAll(List.filled(dy.abs(), "UP"));
      if(dy > 0) commandSequence.addAll(List.filled(dy.abs(), "DOWN"));

      if(dx < 0) commandSequence.addAll(List.filled(dx.abs(), "LEFT"));
      if(dx > 0) commandSequence.addAll(List.filled(dx.abs(), "RIGHT"));

      commandSequence.add("OK");
      keyboard.setPosition(target);
    }

    return commandSequence;
  }
}
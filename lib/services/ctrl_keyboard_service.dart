import 'dart:math';

import 'package:ctrl_alt_tv/interfaces/keyboard.dart';
import 'package:ctrl_alt_tv/models/netflix_keyboard.dart';
import 'package:ctrl_alt_tv/models/youtube_keyboard.dart';

class CtrlKeyboardService {
  Future<List<String>> searchNetflix(String query) async {
    return _generateSearchSequence(query, NetflixKeyboard());
  }

  Future<List<String>> searchYouTube(String query) async {
    return _generateSearchSequence(query, YoutubeKeyboard());
  }

  List<String> _generateSearchSequence(String searchString, Keyboard keyboard) {
    List<String> commandSequence = [];

    Map<String, Point> keyboardMap = keyboard.getKeyboards()[0].keyboard;

    for(var char in searchString.toLowerCase().split("")) {
      if(!keyboard.getKeyboards()[0].keyboard.containsKey(char)) {
        continue;
      }

      var currentPosition = keyboard.getCurrentPosition();
      Point target = keyboardMap[char]!;
      int dRow = target.x.toInt() - currentPosition.x.toInt();
      int dCol = target.y.toInt() - currentPosition.y.toInt();

      if(dCol < 0) commandSequence.addAll(List.filled(dCol.abs(), "LEFT"));
      if(dCol > 0) commandSequence.addAll(List.filled(dCol.abs(), "RIGHT"));

      if(dRow < 0) commandSequence.addAll(List.filled(dRow.abs(), "UP"));
      if(dRow > 0) commandSequence.addAll(List.filled(dRow.abs(), "DOWN"));

      commandSequence.add("SELECT");
      keyboard.setPosition(target);
    }
    return commandSequence;
  }
}
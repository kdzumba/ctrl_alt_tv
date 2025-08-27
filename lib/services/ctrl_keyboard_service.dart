import 'dart:math';

import 'package:ctrl_alt_tv/interfaces/keyboard.dart';
import 'package:ctrl_alt_tv/models/default_keyboard.dart';
import 'package:ctrl_alt_tv/models/netflix_keyboard.dart';
import 'package:ctrl_alt_tv/models/youtube_keyboard.dart';

class CtrlKeyboardService {
  final Keyboard _netflixKeyboard = NetflixKeyboard();
  final Keyboard _tvKeyboard = DefaultKeyboard();
  final Keyboard _youtubeKeyboard = YoutubeKeyboard();

  Future<List<String>> searchNetflix(String query) async {
    return _generateTraversalSequence(query, _netflixKeyboard);
  }

  Future<List<String>> typeOnTvKeyboard(String text) async {
    return _generateTraversalSequence(text, _tvKeyboard);
  }

  Future<List<String>> searchYouTube(String query) async {
    return _generateTraversalSequence(query, _youtubeKeyboard);
  }

  List<String> _generateTraversalSequence(String queryText, Keyboard keyboard) {
    List<String> commandSequence = [];

    Map<String, Point> keyboardMap = keyboard.getKeyboards()[0].keyboard;

    for(var char in queryText.toLowerCase().split("")) {
      if (!keyboard.getKeyboards()[0].keyboard.containsKey(char)) {
        continue;
      }

      var currentPosition = keyboard.getCurrentPosition();
      print("Current position: ${currentPosition.toString()}");
      Point target = keyboardMap[char]!;
      int dRow = target.x.toInt() - currentPosition.x.toInt();
      int dCol = target.y.toInt() - currentPosition.y.toInt();

      if (dCol < 0) commandSequence.addAll(List.filled(dCol.abs(), "LEFT"));
      if (dCol > 0) commandSequence.addAll(List.filled(dCol.abs(), "RIGHT"));

      if (dRow < 0) commandSequence.addAll(List.filled(dRow.abs(), "UP"));
      if (dRow > 0) commandSequence.addAll(List.filled(dRow.abs(), "DOWN"));

      commandSequence.add("SELECT");
      keyboard.setPosition(target);
    }

    keyboard.setCurrentQueryText(queryText);
    print("Current Position: ${keyboard.getCurrentPosition()}");
    return commandSequence;
  }
}
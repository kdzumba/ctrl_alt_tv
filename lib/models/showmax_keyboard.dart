import 'dart:math';

import "package:ctrl_alt_tv/interfaces/keyboard.dart";
import "package:ctrl_alt_tv/models/keyboard_layout.dart";

import "key_area.dart";

class ShowmaxKeyboard extends Keyboard {
  final List<KeyboardLayout> keyboards;

  ShowmaxKeyboard(): keyboards = [] {
    Map<String, KeyArea> defaultAlphaKeyboard = {
      "q": KeyArea(Point(0, 0)),
      "w": KeyArea(Point(0, 1)),
      "e": KeyArea(Point(0, 2)),
      "r": KeyArea(Point(0, 3)),
      "t": KeyArea(Point(0, 4)),
      "y": KeyArea(Point(0, 5)),
      "u": KeyArea(Point(0, 6)),
      "i": KeyArea(Point(0, 7)),
      "o": KeyArea(Point(0, 8)),
      "p": KeyArea(Point(0, 9)),
      "a": KeyArea(Point(1, 0)),
      "s": KeyArea(Point(1, 1)),
      "d": KeyArea(Point(1, 2)),
      "f": KeyArea(Point(1, 3)),
      "g": KeyArea(Point(1, 4)),
      "h": KeyArea(Point(1, 5)),
      "j": KeyArea(Point(1, 6)),
      "k": KeyArea(Point(1, 7)),
      "l": KeyArea(Point(1, 8)),
      "CLEAR": KeyArea(Point(1, 9)),
      "z": KeyArea(Point(2, 0)),
      "x": KeyArea(Point(2, 1)),
      "c": KeyArea(Point(2, 2)),
      "v": KeyArea(Point(2, 3)),
      "b": KeyArea(Point(2, 4)),
      "n": KeyArea(Point(2, 5)),
      "m": KeyArea(Point(2, 6)),
      ".": KeyArea(Point(2, 7)),
      "NUMERIC": KeyArea(Point(2, 8)),
      " ": KeyArea(Point(2, 9))
    };

    final KeyboardLayout defaultLowerCaseMode = KeyboardLayout(defaultAlphaKeyboard);
    keyboards.add(defaultLowerCaseMode);
    currentPosition = Point(0, 0);
  }

  @override
  List<KeyboardLayout> getKeyboards() {
    return keyboards;
  }

  @override
  Point getCurrentPosition() {
    return currentPosition;
  }

  @override
  void reset() {
    currentPosition = Point(0, 0);
  }
}
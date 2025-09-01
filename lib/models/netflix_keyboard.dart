import 'dart:math';

import 'package:ctrl_alt_tv/interfaces/keyboard.dart';
import 'package:ctrl_alt_tv/models/keyboard_layout.dart';

import 'key_area.dart';

class NetflixKeyboard extends Keyboard {
  final List<KeyboardLayout> keyboards;

  NetflixKeyboard(): keyboards = [] {
    Map<String, KeyArea>defaultLowerCaseKeyboard = {
      " ": KeyArea(Point(0, 0), colSpan: 3),
      "backspace": KeyArea(Point(0, 3), colSpan: 3),
      "a": KeyArea(Point(1, 0)),
      "b": KeyArea(Point(1, 1)),
      "c": KeyArea(Point(1, 2)),
      "d": KeyArea(Point(1, 3)),
      "e": KeyArea(Point(1, 4)),
      "f": KeyArea(Point(1, 5)),
      "g": KeyArea(Point(2, 0)),
      "h": KeyArea(Point(2, 1)),
      "i": KeyArea(Point(2, 2)),
      "j": KeyArea(Point(2, 3)),
      "k": KeyArea(Point(2, 4)),
      "l": KeyArea(Point(2, 5)),
      "m": KeyArea(Point(3, 0)),
      "n": KeyArea(Point(3, 1)),
      "o": KeyArea(Point(3, 2)),
      "p": KeyArea(Point(3, 3)),
      "q": KeyArea(Point(3, 4)),
      "r": KeyArea(Point(3, 5)),
      "s": KeyArea(Point(4, 0)),
      "t": KeyArea(Point(4, 1)),
      "u": KeyArea(Point(4, 2)),
      "v": KeyArea(Point(4, 3)),
      "w": KeyArea(Point(4, 4)),
      "x": KeyArea(Point(4, 5)),
      "y": KeyArea(Point(5, 0)),
      "z": KeyArea(Point(5, 1)),
      "1": KeyArea(Point(5, 2)),
      "2": KeyArea(Point(5, 3)),
      "3": KeyArea(Point(5, 4)),
      "4": KeyArea(Point(5, 5)),
      "5": KeyArea(Point(6, 0)),
      "6": KeyArea(Point(6, 1)),
      "7": KeyArea(Point(6, 2)),
      "8": KeyArea(Point(6, 3)),
      "9": KeyArea(Point(6, 4)),
      "0": KeyArea(Point(6, 5))
    };

    final KeyboardLayout defaultLowerCaseMode = KeyboardLayout(defaultLowerCaseKeyboard);
    keyboards.add(defaultLowerCaseMode);
    currentPosition = Point(1, 0);
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
    currentPosition = Point(1, 0);
  }
}
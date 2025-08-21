import 'dart:math';

import 'package:ctrl_alt_tv/interfaces/keyboard.dart';
import 'package:ctrl_alt_tv/models/keyboard_layout.dart';

class NetflixKeyboard extends Keyboard {
  final List<KeyboardLayout> keyboards;

  NetflixKeyboard(): keyboards = [] {
    Map<String, Point>defaultLowerCaseKeyboard = {
      " ": Point(0, 0),
      "backspace": Point(0, 1),
      "a": Point(1, 0),
      "b": Point(1, 1),
      "c": Point(1, 2),
      "d": Point(1, 3),
      "e": Point(1, 4),
      "f": Point(1, 5),
      "g": Point(2, 0),
      "h": Point(2, 1),
      "i": Point(2, 2),
      "j": Point(2, 3),
      "k": Point(2, 4),
      "l": Point(2, 5),
      "m": Point(3, 0),
      "n": Point(3, 1),
      "o": Point(3, 2),
      "p": Point(3, 3),
      "q": Point(3, 4),
      "r": Point(3, 5),
      "s": Point(4, 0),
      "t": Point(4, 1),
      "u": Point(4, 2),
      "v": Point(4, 3),
      "w": Point(4, 4),
      "x": Point(4, 5),
      "y": Point(5, 0),
      "z": Point(5, 1),
      "1": Point(5, 2),
      "2": Point(5, 3),
      "3": Point(5, 4),
      "4": Point(5, 5),
      "5": Point(6, 0),
      "6": Point(6, 1),
      "7": Point(6, 2),
      "8": Point(6, 3),
      "9": Point(6, 4),
      "0": Point(6, 5)
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
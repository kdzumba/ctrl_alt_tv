import "dart:ffi";
import "dart:math";

import "package:ctrl_alt_tv/interfaces/keyboard.dart";
import "package:ctrl_alt_tv/models/keyboard_layout.dart";

class YoutubeKeyboard extends Keyboard {
  final List<KeyboardLayout> keyboards;

  YoutubeKeyboard(): keyboards = [] {
    Map<String, Point>defaultSearchCaseKeyboard = {
      "A": Point(0, 0),
      "B": Point(0, 1),
      "C": Point(0, 2),
      "D": Point(0, 3),
      "E": Point(0, 4),
      "F": Point(0, 5),
      "G": Point(0, 6),
      "backspace": Point(0, 7),
      "H": Point(1, 0),
      "I": Point(1, 1),
      "J": Point(1, 2),
      "K": Point(1, 3),
      "L": Point(1, 4),
      "M": Point(1, 5),
      "N": Point(1, 6),
      "numeric": Point(1, 7),
      "O": Point(2, 0),
      "P": Point(2, 1),
      "Q": Point(2, 2),
      "R": Point(2, 3),
      "S": Point(2, 4),
      "T": Point(2, 5),
      "U": Point(2, 6),
      "language": Point(2, 7),
      "V": Point(3, 0),
      "W": Point(3, 1),
      "X": Point(3, 2),
      "Y": Point(3, 3),
      "Z": Point(3, 4),
      "-": Point(3, 5),
      "'": Point(3, 6),
      " ": Point(4, 0),
      "clear": Point(4, 1),
      "search": Point(4, 2)
    };

    keyboards.add(KeyboardLayout(defaultSearchCaseKeyboard));
    currentPosition = Point(0, 0);
  }

  @override
  List<KeyboardLayout> getKeyboards() {
    return keyboards;
  }

  @override
  Point<num> getCurrentPosition() {
    return currentPosition;
  }

  @override
  void reset() {
    currentPosition = Point(0, 0);
  }
}
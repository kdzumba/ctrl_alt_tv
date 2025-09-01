import "dart:ffi";
import "dart:math";

import "package:ctrl_alt_tv/interfaces/keyboard.dart";
import "package:ctrl_alt_tv/models/key_area.dart";
import "package:ctrl_alt_tv/models/keyboard_layout.dart";

class YoutubeKeyboard extends Keyboard {
  final List<KeyboardLayout> keyboards;

  YoutubeKeyboard(): keyboards = [] {
    Map<String, KeyArea>defaultSearchCaseKeyboard = {
      "A": KeyArea(Point(0, 0)),
      "B": KeyArea(Point(0, 1)),
      "C": KeyArea(Point(0, 2)),
      "D": KeyArea(Point(0, 3)),
      "E": KeyArea(Point(0, 4)),
      "F": KeyArea(Point(0, 5)),
      "G": KeyArea(Point(0, 6)),
      "backspace": KeyArea(Point(0, 7)),
      "H": KeyArea(Point(1, 0)),
      "I": KeyArea(Point(1, 1)),
      "J": KeyArea(Point(1, 2)),
      "K": KeyArea(Point(1, 3)),
      "L": KeyArea(Point(1, 4)),
      "M": KeyArea(Point(1, 5)),
      "N": KeyArea(Point(1, 6)),
      "numeric": KeyArea(Point(1, 7)),
      "O": KeyArea(Point(2, 0)),
      "P": KeyArea(Point(2, 1)),
      "Q": KeyArea(Point(2, 2)),
      "R": KeyArea(Point(2, 3)),
      "S": KeyArea(Point(2, 4)),
      "T": KeyArea(Point(2, 5)),
      "U": KeyArea(Point(2, 6)),
      "language": KeyArea(Point(2, 7)),
      "V": KeyArea(Point(3, 0)),
      "W": KeyArea(Point(3, 1)),
      "X": KeyArea(Point(3, 2)),
      "Y": KeyArea(Point(3, 3)),
      "Z": KeyArea(Point(3, 4)),
      "-": KeyArea(Point(3, 5)),
      "'": KeyArea(Point(3, 6)),
      " ": KeyArea(Point(4, 0)),
      "clear": KeyArea(Point(4, 1)),
      "search": KeyArea(Point(4, 2))
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
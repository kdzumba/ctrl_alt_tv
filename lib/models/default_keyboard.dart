import "dart:math";
import "package:ctrl_alt_tv/models/keyboard_layout.dart";
import "package:ctrl_alt_tv/interfaces/keyboard.dart";

import "key_area.dart";

class DefaultKeyboard extends Keyboard {
  final List<KeyboardLayout> keyboards;

  DefaultKeyboard(): keyboards = [] {
    Map<String, KeyArea> lowerCaseKeyboard = {
      "1": KeyArea(Point(0, 0)),
      "2": KeyArea(Point(0, 1)),
      "3": KeyArea(Point(0, 2)),
      "4": KeyArea(Point(0, 3)),
      "5": KeyArea(Point(0, 4)),
      "6": KeyArea(Point(0, 5)),
      "7": KeyArea(Point(0, 6)),
      "8": KeyArea(Point(0, 7)),
      "9": KeyArea(Point(0, 8)),
      "0": KeyArea(Point(0, 9)),
      "CLEAR": KeyArea(Point(0, 10)),
      "q": KeyArea(Point(1, 0)),
      "w": KeyArea(Point(1, 1)),
      "e": KeyArea(Point(1, 2)),
      "r": KeyArea(Point(1, 3)),
      "t": KeyArea(Point(1, 4)),
      "y": KeyArea(Point(1, 5)),
      "u": KeyArea(Point(1, 6)),
      "i": KeyArea(Point(1, 7)),
      "o": KeyArea(Point(1, 8)),
      "p": KeyArea(Point(1, 9)),
      "-": KeyArea(Point(1, 10)),
      "a": KeyArea(Point(2, 0)),
      "s": KeyArea(Point(2, 1)),
      "d": KeyArea(Point(2, 2)),
      "f": KeyArea(Point(2, 3)),
      "g": KeyArea(Point(2, 4)),
      "h": KeyArea(Point(2, 5)),
      "j": KeyArea(Point(2, 6)),
      "k": KeyArea(Point(2, 7)),
      "l": KeyArea(Point(2, 8)),
      ";": KeyArea(Point(2, 9)),
      "~": KeyArea(Point(2, 10)),
      "SHIFT": KeyArea(Point(3, 0)),
      "z": KeyArea(Point(3, 1)),
      "x": KeyArea(Point(3, 2)),
      "c": KeyArea(Point(3, 3)),
      "v": KeyArea(Point(3, 4)),
      "b": KeyArea(Point(3, 5)),
      "n": KeyArea(Point(3, 6)),
      "m": KeyArea(Point(3, 7)),
      "/": KeyArea(Point(3, 8)),
      ",": KeyArea(Point(3, 9)),
      ".": KeyArea(Point(3, 10)),
      "WEB": KeyArea(Point(4, 0)),
      "NUMERIC": KeyArea(Point(4, 1), colSpan: 2),
      " ": KeyArea(Point(4, 2), colSpan: 5),
      "@": KeyArea(Point(4, 8)),
      "OK": KeyArea(Point(4, 9), colSpan: 2)
    };

    Map<String, KeyArea> numericKeyboard = {
      "_": KeyArea(Point(0, 0)),
      "&": KeyArea(Point(0, 1)),
      "+": KeyArea(Point(0, 2)),
      "1": KeyArea(Point(0, 3)),
      "2": KeyArea(Point(0, 4)),
      "3": KeyArea(Point(0, 5)),
      "\$": KeyArea(Point(0, 6)),
      "~": KeyArea(Point(0, 7)),
      "CLEAR": KeyArea(Point(0, 8)),
      "\\": KeyArea(Point(1, 0)),
      "^": KeyArea(Point(1, 1)),
      "-": KeyArea(Point(1, 2)),
      "4": KeyArea(Point(1, 3)),
      "5": KeyArea(Point(1, 4)),
      "6": KeyArea(Point(1, 5)),
      "!": KeyArea(Point(1, 6)),
      "\"": KeyArea(Point(1, 7)),
      "'": KeyArea(Point(1, 8)),
      "<": KeyArea(Point(2, 0)),
      ">": KeyArea(Point(2, 1)),
      "=": KeyArea(Point(2, 2)),
      "7": KeyArea(Point(2, 3)),
      "8": KeyArea(Point(2, 4)),
      "9": KeyArea(Point(2, 5)),
      "?": KeyArea(Point(2, 6)),
      ";": KeyArea(Point(2, 7)),
      ":": KeyArea(Point(2, 8)),
      "(": KeyArea(Point(3, 0)),
      ")": KeyArea(Point(3, 1)),
      "/": KeyArea(Point(3, 2)),
      "*": KeyArea(Point(3, 3)),
      "0": KeyArea(Point(3, 4)),
      "#": KeyArea(Point(3, 5)),
      "%": KeyArea(Point(3, 6)),
      ",": KeyArea(Point(3, 7)),
      ".": KeyArea(Point(3, 8)),
      "SPECIAL_CHARS": KeyArea(Point(4, 0)),
      "ALPHABETIC": KeyArea(Point(4, 1)),
      " ": KeyArea(Point(4, 2), colSpan: 5),
      "@": KeyArea(Point(4, 7)),
      "OK": KeyArea(Point(4,8))
    };

    final KeyboardLayout lowerCaseMode = KeyboardLayout(lowerCaseKeyboard);
    final KeyboardLayout numericMode = KeyboardLayout(numericKeyboard);
    keyboards.addAll({lowerCaseMode, numericMode});
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
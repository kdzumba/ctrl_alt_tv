import "dart:math";
import "package:ctrl_alt_tv/models/keyboard_layout.dart";
import "package:ctrl_alt_tv/interfaces/keyboard.dart";

class DefaultKeyboard extends Keyboard {
  final List<KeyboardLayout> keyboards;

  DefaultKeyboard(): keyboards = [] {
    Map<String, Point> lowerCaseKeyboard = {
      "1": Point(0, 0),
      "2": Point(0, 1),
      "3": Point(0, 2),
      "4": Point(0, 3),
      "5": Point(0, 4),
      "6": Point(0, 5),
      "7": Point(0, 6),
      "8": Point(0, 7),
      "9": Point(0, 8),
      "0": Point(0, 9),
      "CLEAR": Point(0, 10),
      "q": Point(1, 0),
      "w": Point(1, 1),
      "e": Point(1, 2),
      "r": Point(1, 3),
      "t": Point(1, 4),
      "y": Point(1, 5),
      "u": Point(1, 6),
      "i": Point(1, 7),
      "o": Point(1, 8),
      "p": Point(1, 9),
      "-": Point(1, 10),
      "a": Point(2, 0),
      "s": Point(2, 1),
      "d": Point(2, 2),
      "f": Point(2, 3),
      "g": Point(2, 4),
      "h": Point(2, 5),
      "j": Point(2, 6),
      "k": Point(2, 7),
      "l": Point(2, 8),
      ";": Point(2, 9),
      "~": Point(2, 10),
      "SHIFT": Point(3, 0),
      "z": Point(3, 1),
      "x": Point(3, 2),
      "c": Point(3, 3),
      "v": Point(3, 4),
      "b": Point(3, 5),
      "n": Point(3, 6),
      "m": Point(3, 7),
      "/": Point(3, 8),
      ",": Point(3, 9),
      ".": Point(3, 10),
      "WEB": Point(4, 0),
      "NUMERIC": Point(4, 1),
      " ": Point(4, 2),
      "@": Point(4, 3),
      "OK": Point(4, 4)
    };

    Map<String, Point> numericKeyboard = {
      "_": Point(0, 0),
      "&": Point(0, 1),
      "+": Point(0, 2),
      "1": Point(0, 3),
      "2": Point(0, 4),
      "3": Point(0, 5),
      "\$": Point(0, 6),
      "~": Point(0, 7),
      "CLEAR": Point(0, 8),
      "\\": Point(1, 0),
      "^": Point(1, 1),
      "-": Point(1, 2),
      "4": Point(1, 3),
      "5": Point(1, 4),
      "6": Point(1, 5),
      "!": Point(1, 6),
      "\"": Point(1, 7),
      "'": Point(1, 8),
      "<": Point(2, 0),
      ">": Point(2, 1),
      "=": Point(2, 2),
      "7": Point(2, 3),
      "8": Point(2, 4),
      "9": Point(2, 5),
      "?": Point(2, 6),
      ";": Point(2, 7),
      ":": Point(2, 8),
      "(": Point(3, 0),
      ")": Point(3, 1),
      "/": Point(3, 2),
      "*": Point(3, 3),
      "0": Point(3, 4),
      "#": Point(3, 5),
      "%": Point(3, 6),
      ",": Point(3, 7),
      ".": Point(3, 8),
      "SPECIAL_CHARS": Point(4, 0),
      "ALPHABETIC": Point(4, 1),
      " ": Point(4, 2),
      "@": Point(4, 3),
      "OK": Point(4,4)
    };

    // Map<String, Point> specialCharsKeyboard = {
    //   "§": Point(0, 0),
    //   "`": Point(0, 1),
    //   "|": Point(0, 2),
    //   "•": Point(0, 3),
    //   "SQRT": Point(0, 4),
    //   "+": Point(0, 5),
    //   "DIVIDE": Point(0, 6)
    // };

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

  }
}
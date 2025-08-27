import 'dart:math';

import 'package:ctrl_alt_tv/models/keyboard_layout.dart';

abstract class Keyboard {
  late Point currentPosition;
  late String currentQueryText;

  List<KeyboardLayout> getKeyboards();
  Point getCurrentPosition();
  void reset();
  void setPosition(Point position) => currentPosition = position;
  void setCurrentQueryText(String queryText) => currentQueryText = queryText;
}
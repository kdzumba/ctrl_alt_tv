import 'dart:math';

import 'package:ctrl_alt_tv/models/keyboard_layout.dart';

abstract class Keyboard {
  late Point currentPosition;
  List<KeyboardLayout> getKeyboards();
  Point getCurrentPosition();
  void setPosition(Point position) => currentPosition = position;
}
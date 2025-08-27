import 'package:ctrl_alt_tv/models/keyboard_input_platform.dart';

class KeyboardContext {
  KeyboardInputPlatform platform;
  List<String>? searchCommandSequence;

  KeyboardContext(this.platform, this.searchCommandSequence);
}
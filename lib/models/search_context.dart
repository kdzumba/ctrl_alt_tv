import 'package:ctrl_alt_tv/models/keyboard_input_platform.dart';

class SearchContext {
  KeyboardInputPlatform platform;
  List<String>? searchCommandSequence;

  SearchContext(this.platform, this.searchCommandSequence);
}
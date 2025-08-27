import "package:speech_to_text/speech_to_text.dart" as stt;
import "package:ctrl_alt_tv/services/http_service.dart";

import "../constants/command_constants.dart";

class NativeVoiceService {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool isActive = false;
  String command = "";

  Future<bool> init() async {
    isActive = await _speechToText.initialize(
      onStatus: (status) => print('status: $status'),
      onError: (error) => print('error: $error'),
    );
    return isActive;
  }

  void startListening() {
    _speechToText.listen(
      onResult: (result) async {
        if (result.finalResult) {
          final detectedCommand = result.recognizedWords.trim().toUpperCase();
          if (detectedCommand.isNotEmpty) {
            command = detectedCommand;
            print("Final command detected: $command");
            handleCommand();
          }
        }
      },
      listenFor: const Duration(seconds: 10),
      pauseFor: const Duration(seconds: 5),
    );
  }

  Future<void> handleCommand() async {
    final commandMap = {
      VoiceCommands.kPowerOn: "POWER",
      VoiceCommands.kSelectInputSource: "INPUT",
      VoiceCommands.kOpenNetflix: "NETFLIX",
      VoiceCommands.kOpenYoutube: "YOUTUBE",
      VoiceCommands.kOpenDstv: "DSTV",
      VoiceCommands.kOpenPrimeVideo: "PRIME",
      VoiceCommands.kIncreaseVolume: "VOL_UP",
      VoiceCommands.kDecreaseVolume: "VOL_DOWN",
      VoiceCommands.kMoveLeft: "LEFT",
      VoiceCommands.kMoveRight: "RIGHT",
      VoiceCommands.kMoveUp: "UP",
      VoiceCommands.kMoveDown: "DOWN",
      VoiceCommands.kSelect: "SELECT",
      VoiceCommands.kGoBack: "BACK",
      VoiceCommands.kOpenMenu: "MENU",
      VoiceCommands.kExit: "EXIT",
      VoiceCommands.kGoToHome: "HOME",
      VoiceCommands.kPause: "PAUSE",
      VoiceCommands.kMute: "MUTE",
      VoiceCommands.kClear: "CLEAR"
    };

    final request = commandMap[command];
    if (request != null) {
      await HttpService.sendRequest(request);
    } else {
      print("Voice Command Not Recognized");
    }
  }
}

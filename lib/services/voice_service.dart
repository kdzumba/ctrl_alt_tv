import "dart:convert";

import "package:ctrl_alt_tv/services/http_service.dart";
import "package:vosk_flutter_2/vosk_flutter_2.dart";

class VoiceService {
  final _vosk = VoskFlutterPlugin.instance();
  static const _sampleRate = 16000;
  String command = "";
  bool isActive = false;
  late SpeechService _speechService;

  Future<bool> init() async {
    try{
      final modelPath = await ModelLoader().loadFromAssets("assets/models/vosk-model-small-en-us-0.15.zip");
      final model = await _vosk.createModel(modelPath);
      final recognizer = await _vosk.createRecognizer(
          model: model,
          sampleRate: _sampleRate
      );

      _speechService = await _vosk.initSpeechService(recognizer);
      isActive = true;
      _speechService.onResult().forEach((result) async {
        Map<String, dynamic> object = jsonDecode(result);

        final recognized = object["text"].toString().trim().toUpperCase();
        if(recognized.isNotEmpty) {
          command = recognized;
          print("Final command detected: $command");
          await handleCommand();
        }
      });

    } catch(e){
      print("Failed to initialize Vosk: $e");
      isActive = false;
    }
    return isActive;
  }

  Future<void> startListening() async {
    if(!isActive) return;
    await _speechService.start();
  }

  Future<void> handleCommand() async {
    switch(command) {
      case "POWER ON":
        await HttpService.sendRequest("POWER");
        break;
      case "OPEN NETFLIX":
        await HttpService.sendRequest("NETFLIX");
        break;
      default:
        print("Voice Command Not Recognized");
    }
  }
}
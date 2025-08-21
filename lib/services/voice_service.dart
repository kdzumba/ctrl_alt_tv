import "dart:convert";

import "package:ctrl_alt_tv/services/http_service.dart";
import "package:vosk_flutter_2/vosk_flutter_2.dart";

class VoiceService {
  final _vosk = VoskFlutterPlugin.instance();
  static const _sampleRate = 16000;
  late SpeechService _speechService;
  String command = "";
  bool isActive = false;

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

  Future<void> stopListening() async {
    if(!isActive) return;
    await _speechService.stop();
  }

  Future<void> handleCommand() async {
    switch(command) {
      case "POWER ON":
        await HttpService.sendRequest("POWER");
        break;
      case "SELECT INPUT SOURCE":
        await HttpService.sendRequest("INPUT");
        break;
      case "OPEN NETFLIX":
        await HttpService.sendRequest("NETFLIX");
        break;
      case "OPEN YOUTUBE":
        await HttpService.sendRequest("YOUTUBE");
        break;
      case "OPEN DSTV":
        await HttpService.sendRequest("DSTV");
        break;
      case "OPEN PRIME VIDEO":
        await HttpService.sendRequest("PRIME");
        break;
      case "INCREASE VOLUME":
        await HttpService.sendRequest("VOL_UP");
        break;
      case "DECREASE VOLUME":
        await HttpService.sendRequest("VOL_DOWN");
        break;
      case "MOVE LEFT":
        await HttpService.sendRequest("LEFT");
        break;
      case "MOVE RIGHT":
        await HttpService.sendRequest("RIGHT");
        break;
      case "MOVE UP":
        await HttpService.sendRequest("UP");
        break;
      case "MOVE DOWN":
        await HttpService.sendRequest("DOWN");
        break;
      case "SELECT":
        await HttpService.sendRequest("SELECT");
        break;
      case "GO BACK":
        await HttpService.sendRequest("BACK");
        break;
      case "OPEN MENU":
        await HttpService.sendRequest("MENU");
        break;
      case "EXIT":
        await HttpService.sendRequest("EXIT");
        break;
      case "GO TO HOME":
        await HttpService.sendRequest("HOME");
        break;
      case "PAUSE":
        await HttpService.sendRequest("PAUSE");
        break;
      case "MUTE":
        await HttpService.sendRequest("MUTE");
        break;
      default:
        print("Voice Command Not Recognized");
    }
  }
}
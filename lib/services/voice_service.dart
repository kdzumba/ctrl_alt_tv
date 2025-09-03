// import "dart:convert";
//
// import "package:ctrl_alt_tv/constants/command_constants.dart";
// import "package:ctrl_alt_tv/services/http_service.dart";
// import "package:flutter/services.dart";
// import "package:vosk_flutter_2/vosk_flutter_2.dart";
//
// class VoiceService {
//   final _vosk = VoskFlutterPlugin.instance();
//   static const _sampleRate = 16000;
//   SpeechService? _speechService;
//   String command = "";
//   bool isActive = false;
//
//   Future<bool> init() async {
//     try{
//       final modelPath = await ModelLoader().loadFromAssets("assets/models/vosk-model-small-en-us-0.15.zip");
//       final model = await _vosk.createModel(modelPath);
//       final grammar = await _loadCustomGrammar();
//       final recognizer = await _vosk.createRecognizer(
//           model: model,
//           sampleRate: _sampleRate,
//           grammar: grammar
//       );
//
//       if(_speechService != null) {
//         await _speechService?.stop();
//       }
//
//       if(!isActive) {
//         _speechService = await _vosk.initSpeechService(recognizer);
//       }
//       isActive = true;
//       _speechService?.onResult().forEach((result) async {
//         Map<String, dynamic> object = jsonDecode(result);
//
//         final recognized = object["text"].toString().trim().toUpperCase();
//         if(recognized.isNotEmpty) {
//           command = recognized;
//           print("[CTRL_ALT_TV]: Final command detected: $command");
//           await handleCommand();
//         }
//       });
//
//     } catch(e){
//       print("[CTRL_ALT_TV]: Failed to initialize Vosk: $e");
//       isActive = false;
//     }
//     return isActive;
//   }
//
//   Future<List<String>> _loadCustomGrammar() async {
//     // For simple words, you can define them directly
//     return [
//       "MUTE",
//       "PAUSE",
//       "HOME",
//       "EXIT",
//       "MENU",
//       "BACK",
//       "SELECT",
//       "DOWN",
//       "RIGHT",
//       "LEFT",
//       "UP",
//       "VOLUME",
//       "NETFLIX",
//       "YOUTUBE",
//       "PRIME",
//       "POWER",
//       "INPUT",
//       "DSTV",
//       "INCREASE",
//       "DECREASE",
//       "OPEN",
//       "GO",
//       "TO",
//       "MOVE"
//     ];
//   }
//
//   // Alternative: Load from assets file
//   Future<List<String>> _loadGrammarFromFile() async {
//     try {
//       final content = await rootBundle.loadString('assets/grammar/commands.txt');
//       return content.split('\n').where((line) => line.trim().isNotEmpty).toList();
//     } catch (e) {
//       print("[CTRL_ALT_TV]: Error loading grammar file: $e");
//       return _loadCustomGrammar(); // fallback to default
//     }
//   }
//
//
//   Future<void> startListening() async {
//     if(!isActive) return;
//     await _speechService?.start();
//   }
//
//   Future<void> stopListening() async {
//     if(!isActive) return;
//     await _speechService?.stop();
//   }
//
//   Future<void> handleCommand() async {
//     final commandMap = {
//       VoiceCommands.kPowerOn: "POWER",
//       VoiceCommands.kSelectInputSource: "INPUT",
//       VoiceCommands.kOpenNetflix: "NETFLIX",
//       VoiceCommands.kOpenYoutube: "YOUTUBE",
//       VoiceCommands.kOpenDstv: "DSTV",
//       VoiceCommands.kOpenPrimeVideo: "PRIME",
//       VoiceCommands.kIncreaseVolume: "VOL_UP",
//       VoiceCommands.kDecreaseVolume: "VOL_DOWN",
//       VoiceCommands.kMoveLeft: "LEFT",
//       VoiceCommands.kMoveRight: "RIGHT",
//       VoiceCommands.kMoveUp: "UP",
//       VoiceCommands.kMoveDown: "DOWN",
//       VoiceCommands.kSelect: "SELECT",
//       VoiceCommands.kGoBack: "BACK",
//       VoiceCommands.kOpenMenu: "MENU",
//       VoiceCommands.kExit: "EXIT",
//       VoiceCommands.kGoToHome: "HOME",
//       VoiceCommands.kPause: "PAUSE",
//       VoiceCommands.kMute: "MUTE",
//     };
//
//     final request = commandMap[command];
//     if (request != null) {
//       await HttpService.sendRequest(request);
//     } else {
//       print("[CTRL_ALT_TV]: Voice Command Not Recognized");
//     }
//   }
// }
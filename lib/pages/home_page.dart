import "package:flutter/material.dart";
// import "package:wakelock_plus/wakelock_plus.dart";
import "package:permission_handler/permission_handler.dart";
import "package:ctrl_alt_tv/models/keyboard_input_platform.dart";
import "package:ctrl_alt_tv/services/ctrl_keyboard_service.dart";
import "package:ctrl_alt_tv/services/http_service.dart";
import "package:ctrl_alt_tv/widgets/center_control.dart";
import "package:ctrl_alt_tv/widgets/channel_control.dart";
import "package:ctrl_alt_tv/widgets/ctrl_icon_button.dart";
import "package:ctrl_alt_tv/widgets/ctrl_streaming_controls.dart";
import "package:ctrl_alt_tv/widgets/home_row.dart";
import "package:ctrl_alt_tv/widgets/mute_row.dart";
import "package:ctrl_alt_tv/widgets/power_source_control.dart";
import "package:ctrl_alt_tv/widgets/volume_control.dart";
import "../models/search_context.dart";
import "../services/native_voice_service.dart";
import "../theme/app_spacing.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CtrlKeyboardService keyboardService = CtrlKeyboardService();
  // final VoiceService voiceService = VoiceService();
  final NativeVoiceService nativeVoiceService = NativeVoiceService();
  KeyboardContext keyboardContext = KeyboardContext(
    KeyboardInputPlatform.TV,
    null,
  );

  void _setKeyboardContext(KeyboardInputPlatform platform) {
    setState(() {
      print(
        "[CTRL_ALT_TV]: Search Context is: ${platform.toString().split(".").last}",
      );
      keyboardContext = KeyboardContext(platform, null);
    });
  }

  void _sendCommand(String commandKey) {
    print("[CTRL_ALT_TV]: Command pressed: $commandKey");
    HttpService.sendRequest(commandKey);
  }

  void _streamingSearch(KeyboardInputPlatform platform, String commandKey) {
    _setKeyboardContext(platform);
    _sendCommand(commandKey);
  }

  Future<void> _handleDialogQueryResult(String queryText) async {
    if (queryText.trim().isNotEmpty) {
      print("About to type: $queryText on the current keyboard");

      switch (keyboardContext.platform) {
        case KeyboardInputPlatform.netflix:
          keyboardContext.searchCommandSequence = await keyboardService
              .searchNetflix(queryText);
          break;
        case KeyboardInputPlatform.youTube:
          keyboardContext.searchCommandSequence = await keyboardService
              .searchYouTube(queryText);
          break;
        case KeyboardInputPlatform.showmax:
          keyboardContext.searchCommandSequence = await keyboardService
              .searchShowmax(queryText);
          break;
        default:
          keyboardContext.searchCommandSequence = await keyboardService
              .typeOnTvKeyboard(queryText);
      }
      _sendCommandSequence(keyboardContext.searchCommandSequence!);
    }
  }

  Future<void> _openInputDialog() async {
    final queryText = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String input = "";
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Type On: ${keyboardContext.platform.toString().split(".").last}",
            style: const TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Enter Query Text",
              hintStyle: TextStyle(color: Colors.white54),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            onChanged: (value) => input = value,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, input),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, input),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    await _handleDialogQueryResult(queryText!);
  }

  Future<void> _startSpeechToText() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      status = await Permission.microphone.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Microphone permission denied")),
        );
        return;
      }
    }

    bool available = await nativeVoiceService.init();

    if (available) {
      nativeVoiceService.startListening();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition not available")),
      );
    }
  }

  Future<void> _sendCommandSequence(List<String> commandSequence) async {
    // await WakelockPlus.enable();
    for (var command in commandSequence) {
      _sendCommand(command);
      await Future.delayed(Duration(milliseconds: 500));
    }
    // await WakelockPlus.disable();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 50.0,
              bottom: 0.0,
              left: spacing.appMarginSpacing,
              right: spacing.appMarginSpacing,
            ),
            child: PowerSourceControlWidget(
              onPowerPressed: () => _sendCommand("POWER"),
              onInputPressed: () => _sendCommand("INPUT"),
            ),
          ),
          Center(
            child: SizedBox(
              width: 285,
              height: 275,
              child: Column(
                children: [
                  CenterControlsWidget(
                    onDownPressed: () => _sendCommand("DOWN"),
                    onUpPressed: () => _sendCommand("UP"),
                    onLeftPressed: () => _sendCommand("LEFT"),
                    onRightPressed: () => _sendCommand("RIGHT"),
                    onSelectPressed: () => _sendCommand("SELECT"),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: spacing.appMarginSpacing,
                  bottom: spacing.buttonSpacing,
                ),
                child: CtrlIconButton(
                  icon: const Icon(Icons.mic, color: Colors.white),
                  onPressed: _startSpeechToText,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  right: spacing.appMarginSpacing,
                  bottom: spacing.buttonSpacing,
                ),
                child: CtrlIconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: _openInputDialog,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing.appMarginSpacing),
            child: Row(
              children: [
                VolumeControlsWidget(
                  onIncreasePressed: () => _sendCommand("VOL_UP"),
                  onDecreasePressed: () => _sendCommand("VOL_DOWN"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      HomeRow(
                        onBackPressed: () => _sendCommand("BACK"),
                        onHomePressed: () => _sendCommand("HOME"),
                        onMenuPressed: () => _sendCommand("MENU"),
                      ),
                      MuteRow(
                        onMutePressed: () => _sendCommand("MUTE"),
                        onExitPressed: () => _sendCommand("EXIT"),
                        onPlayPausePressed: () => _sendCommand("PAUSE"),
                      ),
                    ],
                  ),
                ),
                ChannelControlsWidget(
                  onIncreasePressed: () => _sendCommand("CH_UP"),
                  onDecreasePressed: () => _sendCommand("CH_DOWN"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: spacing.appMarginSpacing,
              right: spacing.appMarginSpacing,
              top: spacing.buttonSpacing,
            ),
            child: CtrlStreamingControls(
              onNetflixPressed:
                  () => _streamingSearch(
                    KeyboardInputPlatform.netflix,
                    "NETFLIX",
                  ),
              onYoutubePressed:
                  () => _streamingSearch(
                    KeyboardInputPlatform.youTube,
                    "YOUTUBE",
                  ),
              onPrimeVideoPressed:
                  () => _streamingSearch(
                    KeyboardInputPlatform.primeVideo,
                    "PRIME",
                  ),
              onDefaultPressed:
                  () => _setKeyboardContext(KeyboardInputPlatform.TV),
              // Doesn't have YouTube Music, let's use it for reset
              onShowmaxPressed:
                  () => _streamingSearch(
                    KeyboardInputPlatform.showmax,
                    "SHOWMAX",
                  ),
              onDstvPressed:
                  () => _streamingSearch(KeyboardInputPlatform.dSTV, "DSTV"),
            ),
          ),
        ],
      ),
    );
  }
}

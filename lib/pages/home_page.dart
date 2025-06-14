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
import "package:flutter/material.dart";

import "../models/search_context.dart";
import "../theme/app_spacing.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final esp32IP = "192.168.4.1";
  final scheme = "http";
  final CtrlKeyboardService keyboardService = CtrlKeyboardService();
  SearchContext searchContext = SearchContext(KeyboardInputPlatform.defaultPlatform, null);

  void _setSearchContext(KeyboardInputPlatform context) {
    setState(() {
      searchContext = SearchContext(context, null);
    });
  }

  void _sendCommand(String commandKey) {
    print("Command pressed: $commandKey");
    HttpService.sendRequest("$scheme://$esp32IP/command?key=$commandKey");
  }

  Future<void> _sendCommandSequence(List<String> commandSequence) async {
    for(var command in commandSequence) {
      _sendCommand(command);
      await Future.delayed(Duration(seconds: 1));
    }
  }

  void _streamingSearch(KeyboardInputPlatform platform, String commandKey) {
    _setSearchContext(platform);
    _sendCommand(commandKey);
  }

  Future<void> _openSearchDialog() async {
    final searchString = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String input = "";
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Search ${searchContext.platform ?? ""}",
            style: const TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Enter search phrase",
              hintStyle: TextStyle(color: Colors.white54),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            onChanged: (value) {
              input = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, input),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, input),
              child: Text("Search"),
            ),
          ],
        );
      },
    );

    if (searchString != null && searchString.trim().isNotEmpty) {
      switch(searchContext.platform) {
        case KeyboardInputPlatform.netflix:
          searchContext.searchCommandSequence = await keyboardService.searchNetflix(searchString);
          break;
        case KeyboardInputPlatform.youTube:
          searchContext.searchCommandSequence = await keyboardService.searchYouTube(searchString);
        default:
          searchContext.searchCommandSequence = [];
      }

      _sendCommandSequence(searchContext.searchCommandSequence!);
    }
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
              onInputPressed: () => _sendCommand("INPUT")
            ),
          ),
          Center(
            child: SizedBox(
              width: 285,
              height: 275,
              child: Column(children: [CenterControlsWidget(
                onDownPressed: () => _sendCommand("DOWN"),
                onUpPressed: () => _sendCommand("UP"),
                onLeftPressed: () => _sendCommand("LEFT"),
                onRightPressed: () => _sendCommand("RIGHT"),
                onSelectPressed: () => _sendCommand("SELECT"),
              )]),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                    right: spacing.appMarginSpacing,
                    bottom: spacing.buttonSpacing
                ),
                child: CtrlIconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: _openSearchDialog,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: spacing.appMarginSpacing,
              right: spacing.appMarginSpacing,
            ),
            child: Row(
              children: [
                VolumeControlsWidget(
                  onIncreasePressed: () => _sendCommand("VOL_UP"),
                  onDecreasePressed: () => _sendCommand("VOL_DOWN")
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
              onNetflixPressed: () => _streamingSearch(KeyboardInputPlatform.netflix, "NETFLIX"),
              onYoutubePressed: () => _streamingSearch(KeyboardInputPlatform.youTube, "YOUTUBE"),
              onPrimeVideoPressed:
                  () => _streamingSearch(KeyboardInputPlatform.primeVideo, "PRIME"),
              onYoutubeMusicPressed:
                  () => _streamingSearch(KeyboardInputPlatform.youtubeMusic, "YOUTUBE_MUSIC"),
              onShowmaxPressed: () => _streamingSearch(KeyboardInputPlatform.showmax, "SHOWMAX"),
              onDstvPressed: () => _streamingSearch(KeyboardInputPlatform.dSTV, "DSTV"),
            ),
          ),
        ],
      ),
    );
  }
}

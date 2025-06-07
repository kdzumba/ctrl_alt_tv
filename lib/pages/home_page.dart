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

import "../theme/app_spacing.dart";

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  final esp32IP = "192.168.4.1";
  final scheme = "http";

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
                right: spacing.appMarginSpacing
              ),
              child: PowerSourceControlWidget(
                  onPowerPressed: () {
                    print("Toggling power button...");
                    HttpService.sendRequest("$scheme://$esp32IP/command?key=POWER");
                  },
                  onInputPressed: () {
                    print("Changing input source");
                    HttpService.sendRequest("$scheme://$esp32IP/command?key=INPUT");
                  }),
            ),
            Center(
              child:SizedBox(
                width: 285,
                height: 275,
                child: Column(
                  children: [
                    CenterControlsWidget(),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 8),
                  child: CtrlIconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () async {
                    final searchQuery = await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        String input = "";
                        return AlertDialog(
                          backgroundColor: Colors.grey[900],
                          title: const Text("Search", style: TextStyle(color: Colors.white)),
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
                              child: const Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: const Text("Search"),
                              onPressed: () => Navigator.pop(context, input),
                            ),
                          ],
                        );
                      },
                    );

                    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
                      print("User searched: $searchQuery");
                      // Optionally send to ESP32:
                      // HttpService.sendRequest("$scheme://$esp32IP/search?query=${Uri.encodeComponent(searchQuery)}");
                    }
                  }
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: spacing.appMarginSpacing,
                right: spacing.appMarginSpacing
              ),
              child: Row(
                children: [
                  VolumeControlsWidget(
                      onIncreasePressed: () {
                        print("Increasing the volume");
                        HttpService.sendRequest("$scheme://$esp32IP/command?key=VOL_UP");
                      },
                      onDecreasePressed: () {
                        print("Decreasing the volume");
                        HttpService.sendRequest("$scheme://$esp32IP/command?key=VOL_DOWN");
                      }
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        HomeRow(
                          onBackPressed: () {
                            print("Going back");
                            HttpService.sendRequest("$scheme://$esp32IP/command?key=BACK");
                          },
                          onHomePressed: () {
                            print("Going home");
                            HttpService.sendRequest("$scheme://$esp32IP/command?key=HOME");
                          },
                          onMenuPressed: () {
                            print("Opening the menu");
                            HttpService.sendRequest("$scheme://$esp32IP/command?key=MENU");
                          },
                        ),
                        MuteRow(
                            onMutePressed: () {
                              print("Muting");
                              HttpService.sendRequest("$scheme://$esp32IP/command?key=MUTE");
                            },
                            onPlayPausePressed: () {
                              print("Pausing");
                              HttpService.sendRequest("$scheme://$esp32IP/command?key=PAUSE");
                            },
                            onExitPressed: () {
                              print("Exiting");
                              HttpService.sendRequest("$scheme://$esp32IP/command?key=EXIT");
                            }
                            )
                      ],
                    ),
                  ),
                  ChannelControlsWidget(
                      onIncreasePressed: () {
                        print("Increasing the channel");
                        HttpService.sendRequest("$scheme://$esp32IP/command?key=CH_UP");
                      },
                      onDecreasePressed: () {
                        print("Decreasing the channel");
                        HttpService.sendRequest("$scheme://$esp32IP/command?key=CH_DOWN");
                      }
                  )
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: spacing.appMarginSpacing,
                right: spacing.appMarginSpacing,
                top: spacing.buttonSpacing
              ),
              child: CtrlStreamingControls(
                onNetflixPressed: () {
                  print("Switching over to Netflix...");
                  HttpService.sendRequest("$scheme://$esp32IP/command?key=NETFLIX");
                  },
                onYoutubePressed: () {
                  print("Switching over to YouTube...");
                  HttpService.sendRequest("$scheme://$esp32IP/command?key=YOUTUBE");
                },
                onPrimeVideoPressed: () {
                  print("Switching over to Amazon Prime...");
                  HttpService.sendRequest("$scheme://$esp32IP/command?key=PRIME");
                },
                onYoutubeMusicPressed: ()  => print("Youtube Music pressed"),
                onShowmaxPressed: () {
                  print("Switching to showmax...");
                  HttpService.sendRequest("$scheme://$esp32IP/command?key=SHOWMAX");
                },
                onDstvPressed: () {
                  print("Switching to Dstv...");
                  HttpService.sendRequest("$scheme://$esp32IP/command?key=DSTV");
                },
              ),
            )
          ],
        )
    );
  }
}
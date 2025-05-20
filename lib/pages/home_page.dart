import "package:ctrl_alt_tv/services/http_service.dart";
import "package:ctrl_alt_tv/widgets/center_control.dart";
import "package:ctrl_alt_tv/widgets/channel_control.dart";
import "package:ctrl_alt_tv/widgets/home_row.dart";
import "package:ctrl_alt_tv/widgets/mute_row.dart";
import "package:ctrl_alt_tv/widgets/power_source_control.dart";
import "package:ctrl_alt_tv/widgets/volume_control.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  final esp32IP = "192.168.4.1";
  final scheme = "http";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 35,42),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                bottom: 0.0,
                left: 40.0,
                right: 40.0
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
                width: 300,
                height: 300,
                child: Column(
                  children: [
                    CenterControlsWidget(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40
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
            )
          ],
        )
    );
  }
}
import "package:ctrl_alt_tv/services/http_service.dart";
import "package:ctrl_alt_tv/widgets/center_controls_widget.dart";
import "package:ctrl_alt_tv/widgets/channel_controls_widget.dart";
import "package:ctrl_alt_tv/widgets/power_source_control_widget.dart";
import "package:ctrl_alt_tv/widgets/volume_controls_widget.dart";
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
                top: 45.0,
                bottom: 10.0,
                left: 30.0,
                right: 30.0
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
                height: 220,
                child: Column(
                  children: [
                    CenterControlsWidget(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30
              ),
              child: Row(
                children: [
                  VolumeControlsWidget(
                      onIncreasePressed: () => print("Vol++"),
                      onDecreasePressed: () => print("Vol--")
                  ),
                  Expanded(
                    child: Placeholder(),
                  ),
                  ChannelControlsWidget(
                      onIncreasePressed: () => print("CH++"),
                      onDecreasePressed: () => print("CH--")
                  )
                ]
              ),
            )
          ],
        )
    );
  }
}
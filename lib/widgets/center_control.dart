import "package:ctrl_alt_tv/services/http_service.dart";
import "package:flutter/material.dart";
import "../widgets/button.dart";

class CenterControlsWidget extends StatelessWidget {
  const CenterControlsWidget({super.key});
  final scheme = "http";
  final esp32IP = "192.168.4.1";

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            shape: BoxShape.circle,
          ),
        ),
        Positioned(
          top: 0,
          child: ButtonWidget(
              icon: Icons.keyboard_arrow_up,
              onPressed: () {
                print("Up");
                HttpService.sendRequest("$scheme://$esp32IP/command?key=UP");
              },
            backgroundColor: Colors.deepPurple,
          ),
        ),
        Positioned(
          bottom: 0,
          child: ButtonWidget(
              icon: Icons.keyboard_arrow_down,
              onPressed: () {
                print("Down");
                HttpService.sendRequest("$scheme://$esp32IP/command?key=DOWN");
              },
            backgroundColor: Colors.deepPurple,
          ),
        ),
        Positioned(
          left: 0,
          child: ButtonWidget(
              icon: Icons.keyboard_arrow_left,
              onPressed: () {
                print("Left");
                HttpService.sendRequest("$scheme://$esp32IP/command?key=LEFT");
              },
            backgroundColor: Colors.deepPurple,
          ),
        ),
        Positioned(
          right: 0,
          child: ButtonWidget(
              icon: Icons.keyboard_arrow_right,
              onPressed: () {
                print("Right");
                HttpService.sendRequest("$scheme://$esp32IP/command?key=RIGHT");
              },
            backgroundColor: Colors.deepPurple,
          ),
        ),
        Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.black,
                    width: 1
                )
            ),
            child: ElevatedButton(
                onPressed: () {
                  print("OK");
                  HttpService.sendRequest("$scheme://$esp32IP/command?key=SELECT");
                },
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(24),
                    backgroundColor: Colors.deepPurple
                ),
                child: Text(
                    "OK",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    )
                )
            )
        )
      ],
    );
  }
}
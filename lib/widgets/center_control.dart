import "package:ctrl_alt_tv/services/http_service.dart";
import "package:ctrl_alt_tv/theme/app_theme.dart";
import "package:flutter/material.dart";
import "../widgets/ctrl_icon_button.dart";

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
          width: 270,
          height: 270,
          decoration: BoxDecoration(
            color: Color(0xFF262229),
            shape: BoxShape.circle,
          ),
        ),
        Positioned(
          top: 2,
          child: CtrlIconButton(
              icon: Icon(Icons.keyboard_arrow_up, color: Colors.white,),
              onPressed: () {
                print("Up");
                HttpService.sendRequest("$scheme://$esp32IP/command?key=UP");
              },
          ),
        ),
        Positioned(
          bottom: 2,
          child: CtrlIconButton(
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
              onPressed: () {
                print("Down");
                HttpService.sendRequest("$scheme://$esp32IP/command?key=DOWN");
              },
          ),
        ),
        Positioned(
          left: 2,
          child: CtrlIconButton(
              icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
              onPressed: () {
                print("Left");
                HttpService.sendRequest("$scheme://$esp32IP/command?key=LEFT");
              },
          ),
        ),
        Positioned(
          right: 2,
          child: CtrlIconButton(
              icon: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              onPressed: () {
                print("Right");
                HttpService.sendRequest("$scheme://$esp32IP/command?key=RIGHT");
              },
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
                    padding: EdgeInsets.all(30),
                  backgroundColor: AppTheme.primaryBackgroundColor
                ),
                child: Text(
                    "OK",
                    style: Theme.of(context).textTheme.displayMedium
                )
            )
        )
      ],
    );
  }
}
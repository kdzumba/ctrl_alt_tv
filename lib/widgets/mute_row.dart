import "package:ctrl_alt_tv/widgets/button.dart";
import "package:ctrl_alt_tv/services/http_service.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class MuteRow extends StatelessWidget {
  final VoidCallback onMutePressed;
  final VoidCallback onPlayPausePressed;
  final VoidCallback onExitPressed;
  final scheme = "http";
  final esp32IP = "192.168.4.1";

  const MuteRow({
    super.key,
    required this.onMutePressed,
    required this.onPlayPausePressed,
    required this.onExitPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 7,
              top: 7,
              right: 7
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.white30
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ButtonWidget(
                  icon: Icons.pause,
                  onPressed: onPlayPausePressed,
                  backgroundColor: Color.fromARGB(255, 32, 35, 42)
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: 7,
              right: 7
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.white30
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ButtonWidget(
                  icon: FontAwesomeIcons.volumeMute,
                  onPressed: onMutePressed,
                  backgroundColor: Color.fromARGB(255, 32, 35, 42)
              )
            )
          )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: 7,
              right: 7
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.white30
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () {
                  print("Exiting");
                  HttpService.sendRequest("$scheme://$esp32IP/command?key=EXIT");
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(5),
                  backgroundColor: Color.fromARGB(255, 32, 35, 42)
                ),
                child: Text(
                  "Exit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                )
              )
            )
          )
        )
      ],
    );
  }
}
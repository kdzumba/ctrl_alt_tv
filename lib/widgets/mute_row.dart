import "package:ctrl_alt_tv/widgets/ctrl_icon_button.dart";
import "package:ctrl_alt_tv/services/http_service.dart";
import "package:ctrl_alt_tv/widgets/ctrl_text_button.dart";
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: CtrlIconButton(
                  icon: Icons.pause,
                  onPressed: onPlayPausePressed,
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: CtrlIconButton(
                  icon: FontAwesomeIcons.volumeMute,
                  onPressed: onMutePressed,
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
            child: CtrlTextButton(text: "EXIT", onPressed: onExitPressed)
          ),
        )
      ],
    );
  }
}
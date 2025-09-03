import "package:ctrl_alt_tv/widgets/ctrl_icon_button.dart";
import "package:ctrl_alt_tv/widgets/ctrl_text_button.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

import "../theme/app_spacing.dart";

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
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: spacing.buttonSpacing,
              top: spacing.buttonSpacing,
              right: spacing.buttonSpacing
            ),
            child: CtrlIconButton(
                icon: Icon(Icons.pause, color: Colors.white),
                onPressed: onPlayPausePressed,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: spacing.buttonSpacing,
              right: spacing.buttonSpacing
            ),
            child: CtrlIconButton(
                icon: Icon(FontAwesomeIcons.volumeMute, color: Colors.white),
                onPressed: onMutePressed,
            )
          )
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(
                  top: spacing.buttonSpacing,
                  right: spacing.buttonSpacing
              ),
            child: CtrlTextButton(text: "EXIT", onPressed: onExitPressed)
          ),
        )
      ],
    );
  }
}
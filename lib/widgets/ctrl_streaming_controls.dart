import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "ctrl_icon_button.dart";

class CtrlStreamingControls extends StatelessWidget{
  final VoidCallback onNetflixPressed;
  final VoidCallback onYoutubePressed;
  final VoidCallback onYoutubeMusicPressed;
  final VoidCallback onPrimeVideoPressed;
  final VoidCallback onShowmaxPressed;
  final VoidCallback onDstvPressed;

  const CtrlStreamingControls({
    super.key,
    required this.onNetflixPressed,
    required this.onYoutubePressed,
    required this.onYoutubeMusicPressed,
    required this.onPrimeVideoPressed,
    required this.onShowmaxPressed,
    required this.onDstvPressed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 7
                ),
                child: CtrlIconButton(
                  backgroundColor: Colors.white,
                  onPressed: onNetflixPressed,
                  icon: SvgPicture.asset(
                    "assets/icons/netflix-3.svg",
                    height: 23,
                    width: 85,
                  ),
                ),
              ),
            ),
            Expanded(
              child: CtrlIconButton(
                  backgroundColor: Colors.white,
                  icon: SvgPicture.asset(
                    "assets/icons/youtube-6.svg",
                    height: 23,
                    width: 85,
                  ),
                  onPressed: onYoutubePressed
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 7
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 7
                  ),
                  child: CtrlIconButton(
                    backgroundColor: Colors.white,
                    onPressed: onYoutubeMusicPressed,
                    icon: SvgPicture.asset(
                      "assets/icons/icons8-youtube-music.svg",
                      height: 32,
                      width: 44,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CtrlIconButton(
                    backgroundColor: Colors.white,
                    icon: SvgPicture.asset(
                      "assets/icons/amazon-prime-video-1.svg",
                      height: 23,
                      width: 85,
                    ),
                    onPressed: onPrimeVideoPressed
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 7
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 7
                  ),
                  child: CtrlIconButton(
                    backgroundColor: Colors.white,
                    onPressed: onShowmaxPressed,
                    icon: SvgPicture.asset(
                      "assets/icons/showmax-logo-vector.svg",
                      height: 20,
                      width: 85,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CtrlIconButton(
                    backgroundColor: Colors.white,
                    icon: SvgPicture.asset(
                      "assets/icons/dstv-logo.svg",
                      height: 20,
                      width: 85
                    ),
                    onPressed: onDstvPressed
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioButton extends StatelessWidget {
  final String suara;
  const AudioButton({
    Key? key,
    required this.suara,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        AudioPlayer player = AudioPlayer();

        await player.play(suara);
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/play_button.png',
            ),
          ),
        ),
      ),
    );
  }
}

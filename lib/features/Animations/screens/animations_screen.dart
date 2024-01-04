import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  bool isPlaying = false;
  AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();
    return Scaffold(
      appBar: AppBar(title: Text('Animation'),),
      body:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/drum_stick.gif',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 150,
                ),
                // IconButton(
                //   onPressed: () async {
                //     // if (widget.isPlaying) {
                //     //   await audioPlayer.pause();
                //     //   print(widget.isPlaying);
                //     //   setState(() {
                //     //     widget.isPlaying = false;
                //     //   });
                //     // } else {
                //     //   await audioPlayer.play(AssetSource('audio/traffic.mp3'));
                //     //   setState(() {
                //     //     widget.isPlaying = true;
                //     //   });
                //     // }
                //   },
                //   icon: Icon(widget.isPlaying ? Icons.pause : Icons.play_arrow),
                // ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1, color: Theme.of(context).colorScheme.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: () async {
                      await audioPlayer.play(AssetSource('audio/traffic.mp3'));
                    },
                    child: Text('Play')),
                TextButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1, color: Theme.of(context).colorScheme.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: () async {
                      await audioPlayer.pause();
                    },
                    child: Text('Pause'))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/water_tap.gif',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 150,
                ),
                TextButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1, color: Theme.of(context).colorScheme.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: () async {
                      await audioPlayer.play(AssetSource('audio/water.mp3'));
                    },
                    child: Text('Play')),
                TextButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1, color: Theme.of(context).colorScheme.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: () async {
                      await audioPlayer.pause();
                    },
                    child: Text('Pause'))
              ],
            )
          ]),
        ),
      );
  }
}

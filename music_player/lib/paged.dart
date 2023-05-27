import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  Duration totalDuration = const Duration();
  double currentAudioPosition = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Songs;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("__SONG__"),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black,
            Colors.yellow,
            Colors.teal,
            Colors.redAccent,
            Colors.blueGrey,
            Colors.pink,
            Colors.purple,
            Colors.cyan,
            Colors.orangeAccent
          ], end: Alignment.topLeft, begin: Alignment.bottomRight)),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 450,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(args.image), fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "❤ ${args.name}",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                args.id,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: assetsAudioPlayer.currentPosition,
                builder: (context, snapshot) {
                  currentAudioPosition =
                      (snapshot.data as Duration).inSeconds.toDouble();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data.toString().split('.')[0],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            const Spacer(),
                            Text(totalDuration.toString().split('.')[0],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ),
                      Slider(
                        value: currentAudioPosition,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black,
                        min: 0,
                        max: totalDuration.inSeconds.toDouble(),
                        onChanged: (val) {
                          setState(() {
                            currentAudioPosition = val;
                          });
                        },
                      )
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        await assetsAudioPlayer.open(Audio(args.song));

                        setState(() {
                          totalDuration =
                              assetsAudioPlayer.current.value!.audio.duration;
                        });
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () async {
                        await assetsAudioPlayer.pause();
                      },
                      icon: const Icon(
                        Icons.pause,
                        size: 30,
                      )),
                  IconButton(
                    onPressed: () async {
                      await assetsAudioPlayer.stop();

                      setState(() {
                        totalDuration = const Duration(seconds: 0);
                      });
                    },
                    icon: const Icon(
                      Icons.stop,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

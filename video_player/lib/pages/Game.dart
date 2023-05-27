import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../itemlist.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late VideoPlayerController controller1;
  late VideoPlayerController controller2;
  late VideoPlayerController controller3;
  late ChewieController chewieController1;
  late ChewieController chewieController2;
  late ChewieController chewieController3;
  List video = [
    'https://assets.mixkit.co/videos/preview/mixkit-several-gamers-playing-on-computers-43541-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-hands-of-a-man-playing-on-a-computer-43527-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-young-woman-playing-in-front-of-a-gamer-computer-43540-large.mp4',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller1 = VideoPlayerController.network(
      video[0].toString(),
    );
    controller1.initialize().then((_) {
      setState(() {});
    });
    controller2 = VideoPlayerController.network(
      video[1].toString(),
    );
    controller2.initialize().then((_) {
      setState(() {});
    });
    controller3 = VideoPlayerController.network(
      video[2].toString(),
    );
    controller3.initialize().then((_) {
      setState(() {});
    });
    chewieController1 = ChewieController(
        videoPlayerController: controller1, autoPlay: true, looping: false);
    chewieController2 = ChewieController(
        videoPlayerController: controller2, autoPlay: true, looping: false);
    chewieController3 = ChewieController(
        videoPlayerController: controller3, autoPlay: true, looping: false);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          controller1.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller1.value.aspectRatio,
                  child: Chewie(
                    controller: chewieController1,
                  ))
              : Container(),
          const SizedBox(
            height: 10,
          ),
          controller2.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller2.value.aspectRatio,
                  child: Chewie(
                    controller: chewieController2,
                  ))
              : Container(),
          const SizedBox(
            height: 10,
          ),
          controller3.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller3.value.aspectRatio,
                  child: Chewie(
                    controller: chewieController3,
                  ))
              : Container(),
        ],
      ),
      /*   floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller1.value.isPlaying
                ? controller1.pause()
                : controller1.play();
          });
        },
        child: Icon(
          controller1.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),*/
    );
  }
}

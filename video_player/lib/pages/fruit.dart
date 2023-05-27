import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../itemlist.dart';

class Fruit extends StatefulWidget {
  const Fruit({Key? key}) : super(key: key);

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  late VideoPlayerController controller1;
  late VideoPlayerController controller2;
  late VideoPlayerController controller3;
  late ChewieController chewieController1;
  late ChewieController chewieController2;
  late ChewieController chewieController3;
  List video = [
    'https://mixkit.co/free-stock-video/man-putting-on-virtual-reality-glasses-43567/',
    'https://assets.mixkit.co/videos/preview/mixkit-woman-using-a-virtual-reality-headset-sitting-on-her-bed-43568-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-fireworks-illuminating-the-beach-sky-4157-large.mp4',
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
          SizedBox(
            height: 10,
          ),
          controller1.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller1.value.aspectRatio,
                  child: Chewie(
                    controller: chewieController1,
                  ))
              : Container(),
          SizedBox(
            height: 10,
          ),
          controller2.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller2.value.aspectRatio,
                  child: Chewie(
                    controller: chewieController2,
                  ))
              : Container(),
          SizedBox(
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

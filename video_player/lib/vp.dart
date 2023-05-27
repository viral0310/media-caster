import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'itemlist.dart';

class Vp extends StatefulWidget {
  const Vp({Key? key}) : super(key: key);

  @override
  State<Vp> createState() => _VpState();
}

class _VpState extends State<Vp> {
  late List<VideoPlayerController> controller1 = [];
  late List<VideoPlayerController> controller2 = [];
  late List<VideoPlayerController> controller3 = [];
  late List<VideoPlayerController> controller4 = [];
  late VideoPlayerController controller123;
  late ChewieController chewieController1;
/*  late VideoPlayerController _controller;
  late ChewieController _chewieController;*/
  void initState() {
    super.initState();
    controller1 =
        Global.cats.map((e) => VideoPlayerController.network(e.link1)).toList();
    /*  controller1.initialize().then((_) {
      setState(() {});
    });*/
    controller2 =
        Global.cats.map((e) => VideoPlayerController.network(e.link2)).toList();

    controller3 =
        Global.cats.map((e) => VideoPlayerController.network(e.link3)).toList();
    controller4 =
        Global.cats.map((e) => VideoPlayerController.network(e.link4)).toList();

    /* _controller = VideoPlayerController.network(
      //'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
      'https://assets.mixkit.co/videos/preview/mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-large.mp4',
    );*/
    /*   _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
    _chewieController = ChewieController(
        videoPlayerController: _controller, autoPlay: true, looping: false);*/

    //controller123 = VideoPlayerController.network();
    chewieController1 = ChewieController(
        videoPlayerController: controller1.first,
        autoPlay: true,
        looping: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    /* _controller.dispose();
    _chewieController.dispose();*/
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      body: Center(
        child: controller1.first.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller1.first.value.aspectRatio,
                child: Chewie(
                  controller: chewieController1,
                ))
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller1.first.value.isPlaying
                ? controller1.first.pause()
                : controller1.first.play();
          });
        },
        child: Icon(
          controller1.first.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),

      /*Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Chewie(
                  controller: _chewieController,
                ))
            : Container(),
      ),*/
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),*/
    );
  }
}

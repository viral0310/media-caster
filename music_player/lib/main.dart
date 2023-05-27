import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/paged.dart';

import 'list.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("MUSIC PLAYER"),
      ),
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
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
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 1 / 1.8,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3),
          itemCount: Song.length,
          itemBuilder: (context, i) {
            var index = Song[i];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    /*   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(),
                          ),
                        );*/
                    Navigator.of(context)
                        .pushNamed('/details', arguments: index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 300,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(0, 0),
                              blurRadius: 5,
                              spreadRadius: 2),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        //  color: Colors.red.withOpacity(0.5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(index.image))),
                    alignment: Alignment.center,
                    child: Container(),
                  ),
                ),
                Text(
                  index.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ],
            );
          },
        ),
      ]),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds);

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    audioPlayer.onPositionChanged.listen((event) {
      position = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Music Player"),
          centerTitle: true,
        ),
        body: SizedBox(
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
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://lh3.googleusercontent.com/Uk0d-FHqoCud49RcjNuZ9Clk_e5quj_EEXln8Hd8ShFeJHKXicqOtZuYc-LtL5TLjGy1-Bk71d2AvSFg2oXwsWpRtoaErLh8Jg=w960-rj-nu-e365'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "❤ We Don't Talk Anymore",
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "V - Kim Taehyung",
                style: const TextStyle(fontSize: 20),
              ),
              Slider(
                min: 0,
                max: duration.inMinutes.toDouble(),
                value: position.inMinutes.toDouble(),
                onChanged: (val) async {
                  final position = Duration(minutes: val.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 50,
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        String url =
                            'https://open.spotify.com/artist/0C8ZW7ezQVs4URX5aX7Kqx';
                        await audioPlayer.play(UrlSource(url));
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

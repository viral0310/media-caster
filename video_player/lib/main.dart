import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:vedio_player/pages/City.dart';
import 'package:vedio_player/pages/Game.dart';
import 'package:vedio_player/pages/fruit.dart';
import 'package:vedio_player/pages/nature.dart';
import 'package:vedio_player/pages/spots.dart';
import 'package:vedio_player/vp.dart';
import 'package:video_player/video_player.dart';
import 'itemlist.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (context) => Vp(),
        '/home': (context) => HomePage(),
        '/nature': (context) => Nature(),
        '/spot': (context) => Spots(),
        '/game': (context) => Game(),
        '/fruit': (context) => Fruit(),
        '/city': (context) => City(),
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
        title: Text("Video App"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: Global.cats
                .map(
                  (e) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(e.routs, arguments: e);
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: e.color,
                        ),
                        alignment: Alignment.center,
                        height: 150,
                        width: double.infinity,
                        child: Text(
                          e.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

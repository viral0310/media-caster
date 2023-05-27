import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  checkPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Timer(const Duration(seconds: 15), () async {
      await prefs.setBool('isIntroVisited', true);
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            FlutterLogo(
              size: 250,
            ),
            CircularProgressIndicator(
              color: Colors.amber,
            ),
            Text(
              "Authentication_App",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

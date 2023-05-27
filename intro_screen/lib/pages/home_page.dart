import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                await prefs.setBool('isLoggedIn', false);
                Navigator.of(context).pushReplacementNamed('/intro_screen');
              },
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          "Welcome To HomePage",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 23),
        ),
      ),
    );
  }
}

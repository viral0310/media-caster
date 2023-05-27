import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                await prefs.setBool('isLoggedIn', false);
                Navigator.of(context).pushReplacementNamed('/login');
              },
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.black,
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

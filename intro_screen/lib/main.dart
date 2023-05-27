import 'package:flutter/material.dart';
import 'package:intro_screen/pages/home_page.dart';
import 'package:intro_screen/pages/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(
    /* MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro_screen',
      routes: {
        '/': (context) => HomeScreen(),
        '/intro_screen': (context) => IntroScreen(),
      },
    ),*/
    MyApp(showHome: showHome),
  );
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.teal,
      )),
      debugShowCheckedModeBanner: false,
      /* initialRoute: (showHome == false) ? '/' : '/intro_screen',*/
      initialRoute: '/intro_screen',
      routes: {
        '/': (context) => const HomeScreen(),
        '/intro_screen': (context) => const IntroScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_authentication_app/screens/HomePage.dart';
import 'package:user_authentication_app/screens/intro%20screen.dart';
import 'package:user_authentication_app/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  bool? isIntroVisited = prefs.getBool('isIntroVisited') ?? false;

  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.amber,
        ),
      ),
      // initialRoute: //(isIntroVisited == false)
      // ?
      // '/intro_screen',
      /*   : (isLoggedIn == false)
              ? '/login'
              : '/',*/
      initialRoute: /*(isIntroVisited == false)
          ? '/intro_screen'
          : */
          (isLoggedIn == false) ? '/login' : '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LogInPage(),
        '/intro_screen': (context) => IntroScreen(),
      },
    ),
  );
}

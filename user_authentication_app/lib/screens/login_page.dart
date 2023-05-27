import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "LogIn Page",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Email here...',
                label: Text('Email'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password here...',
                label: Text('password'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Spacer(),
            CheckboxListTile(
              tileColor: Colors.amber,
              title: Text(
                "Remember me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: isLogin,
              onChanged: (val) async {
                setState(
                  () {
                    isLogin = val!;
                  },
                );
                String email = emailController.text;
                String password = passwordController.text;

                SharedPreferences prefs = await SharedPreferences.getInstance();
                if (email == 'admin@gmail.com' && password == '123456') {
                  prefs.setBool('isLoggedIn', true);
                  Navigator.of(context).pushReplacementNamed('/');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Wrong credential"),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

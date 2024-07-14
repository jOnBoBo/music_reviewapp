import 'package:flutter/material.dart';
import 'package:music_junkie/screens/google_sign_in.dart';
import 'package:music_junkie/screens/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Music Junkie"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginWithGoogle(),
                  ),
                );
              },
              child: Text("Login with google"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AuthScreen(),
                  ),
                );
              },
              child: Text("Email/Password Sign In/Up"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_junkie/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Revoke Google Sign-In credentials
            await _googleSignIn.signOut();

            // Sign out from Firebase Authentication
            await FirebaseAuth.instance.signOut();
            // Navigate back to the AuthScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}

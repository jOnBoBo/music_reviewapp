import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_junkie/buttons/settings_button.dart';
import 'package:music_junkie/buttons/profile_and_search_button.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _email = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _email = user.email ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          SettingsButton(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: $_email'),
            // Add other user data fields here
          ],
        ),
      ),
      bottomNavigationBar: BottomButtons(
        musicButtonOnPressed: () {
          // Handle music button press
        },
        profileButtonOnPressed: () {
          // Handle profile button press
        },
      ),
    );
  }
}

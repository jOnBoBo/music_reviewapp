import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import 'package:music_junkie/pages/profile_page.dart'; // Import the ProfilePage

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isCreateAccount = false; // Initially set to false for sign-in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isCreateAccount ? 'Create an Account' : 'Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                onChanged: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onChanged: (value) => _password = value,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      if (_isCreateAccount) {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _email,
                          password: _password,
                        );
                      } else {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _email,
                          password: _password,
                        );
                      }
                      // Navigate to ProfilePage after successful login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Incorrect email or password. Please try again'),
                        ),
                      );
                    }
                  }
                },
                child: Text(_isCreateAccount ? 'Create an Account' : 'Sign In'),
              ),
              TextButton(
                onPressed: _forgotPassword,
                child: Text('Forgot Password?'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isCreateAccount = !_isCreateAccount;
                  });
                },
                child: Text(_isCreateAccount
                    ? 'Already have an account? Sign In'
                    : 'Don\'t have an account? Create an Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _forgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotPasswordScreen(),
      ),
    );
  }
}

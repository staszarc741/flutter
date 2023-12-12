import 'package:flutter/material.dart';
import 'package:fizmat/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:fizmat/services/auth_status_helper.dart'; 

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoginForm = true; // Variable to track the current form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // No title in the app bar
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isLoginForm ? 'Sign In' : 'Register',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                print(_isLoginForm ? 'Sign In button clicked' : 'Register button clicked');
                FirebaseAuth.User? user = _isLoginForm
                    ? await _authService.signInWithEmailAndPassword(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      )
                    : await _authService.registerWithEmailAndPassword(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );

                if (user != null) {
                  print(_isLoginForm ? 'Sign In successful' : 'Registration successful');
                  // Save user ID
                  await AuthStatusHelper.saveUserId(user.uid);

                  // Save authentication status
                  await AuthStatusHelper.saveAuthStatus(true);

                  // Navigate to the authorized screen
                  _navigateToMainScreen();
                } else {
                  print(_isLoginForm ? 'Sign In failed' : 'Registration failed');
                  // Handle form-specific failure
                  final errorMessage = _isLoginForm
                      ? 'Sign In failed. Check your credentials.'
                      : 'Registration failed. Please try again.';
                  showErrorMessage(errorMessage);
                }
              },
              child: Text(_isLoginForm ? 'Sign In' : 'Register'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLoginForm = !_isLoginForm;
                });
              },
              child: Text(
                _isLoginForm ? 'Not Registered Yet?' : 'Sign In',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to show error message
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
  }

  void _navigateToMainScreen() async {
    // Check if the user is authenticated
    String? userId = await AuthStatusHelper.getUserId();

    if (userId != null) {
      // User is authenticated, navigate to the authorized screen
      Navigator.pushReplacementNamed(context, '/authorized_screen');
    } else {
      // User is not authenticated, handle accordingly
      print('User not authenticated after successful sign-in or registration');
    }
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fizmat/screens/authScreen.dart';
import 'package:fizmat/screens/mainScreen.dart';
import 'package:fizmat/screens/gradesScreen.dart'; 
import 'package:fizmat/screens/scheduleScreen.dart'; 
import 'package:fizmat/screens/subjectsScreen.dart'; 
import 'package:fizmat/screens/detailedCourseScreen.dart'; 
import 'package:fizmat/services/auth_status_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        // Set the default font family to Roboto
        fontFamily: 'Roboto',
        brightness: Brightness.light,
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
          background: Colors.white,
          onBackground: Colors.black,
          // Add other color properties if needed
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 14.0), // You can add more styles here
        ),
      ),
      home: AuthenticationHandler(),
      routes: {
        '/main': (context) => MainScreen(),
        '/grades': (context) => GradesScreen(),
        '/schedule': (context) => ScheduleScreen(),
        '/subjects': (context) => SubjectsScreen(),
        '/course-detail': (context) => CourseDetailScreen(classes: [],),
      },
    );
  }
}

class AuthenticationHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: AuthStatusHelper.getAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          bool isAuthenticated = snapshot.data ?? false;
          return isAuthenticated ? MainScreen() : AuthScreen();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

 
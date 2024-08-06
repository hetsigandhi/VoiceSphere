import 'package:flutter/material.dart';
import 'package:pages/screens/dashboard.dart';
import 'package:pages/screens/fullname.dart';
import 'package:pages/screens/otp.dart';
import 'package:pages/screens/phone.dart';
import 'package:pages/screens/welcome.dart';
//import 'package:your_app_name/notification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoiceSphere',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PhoneSignInScreen(),
        '/verify': (context) => VerificationCodeScreen(),
        '/fullname': (context) => FullNameScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}

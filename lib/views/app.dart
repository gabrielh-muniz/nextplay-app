import 'package:flutter/material.dart';
import './login_email.page.dart';
import './welcome.page.dart';

class NextPlayApp extends StatelessWidget {
  const NextPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/login': (context) => LoginPageEmail(),
      },
    );
  }
}

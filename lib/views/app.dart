import 'package:flutter/material.dart';
import 'package:nextplay/views/login_pw.page.dart';
import 'package:nextplay/views/register.page.dart';
import './login_email.page.dart';
import './welcome.page.dart';
import './user_type.page.dart';

class NextPlayApp extends StatelessWidget {
  const NextPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/register',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/login-email': (context) => LoginPageEmail(),
        '/login-pw': (context) => LoginPagePw(),
        '/user-type': (context) => UserType(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}

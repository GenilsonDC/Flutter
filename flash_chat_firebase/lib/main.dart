import 'package:flutter/material.dart';
import 'package:flash_chat_firebase/screens/welcome_screen.dart';
import 'package:flash_chat_firebase/screens/login_screen.dart';
import 'package:flash_chat_firebase/screens/registration_screen.dart';
import 'package:flash_chat_firebase/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: 'chat_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) =>RegistrationScreen(),
        'chat_screen': (context) => ChatScreen(),
      },
    );
  }
}

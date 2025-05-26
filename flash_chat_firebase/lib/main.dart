import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_firebase/screens/welcome_screen.dart';
import 'package:flash_chat_firebase/screens/login_screen.dart';
import 'package:flash_chat_firebase/screens/registration_screen.dart';
import 'package:flash_chat_firebase/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Garante que os plugins sejam inicializados
  await Firebase.initializeApp();

  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}

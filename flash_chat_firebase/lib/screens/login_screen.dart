import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_firebase/components/rounded_button.dart';
import 'package:flash_chat_firebase/constants/constants.dart';
import 'package:flash_chat_firebase/screens/chat_screen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  void loginUser() async {
    FocusScope.of(context).unfocus(); // Fecha o teclado

    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos.")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user.user != null) {
        emailController.clear();
        passwordController.clear();
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      debugPrint("Erro no login: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao fazer login: $e")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6E5E6),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                const SizedBox(height: 48.0),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xff393939)),
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "seuemail@email"),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xff393939)),
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "Digite a senha"),
                ),
                const SizedBox(height: 24.0),
                RoundedButton(
                  title: "Entrar",
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  onPressed: loginUser,
                ),
                const SizedBox(height: 1.0),
                SizedBox(
                  height: 110,
                  child: Image.asset('images/Catandfly.gif', fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.blueAccent,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}

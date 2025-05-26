import 'package:flash_chat_firebase/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_firebase/components/rounded_button.dart';
import 'package:flash_chat_firebase/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  void registerUser() async {
    FocusScope.of(context).unfocus(); // Fecha o teclado

    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, preencha todos os campos.")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (newUser.user != null) {
        emailController.clear();
        passwordController.clear();
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      debugPrint("Erro no registro: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao registrar: $e")),
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
      backgroundColor: Colors.white,
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
                      kTextFieldDecoration.copyWith(hintText: "seuemail@mail"),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xff393939)),
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Digite uma senha"),
                ),
                const SizedBox(height: 24.0),
                RoundedButton(
                  title: "Registrar",
                  color: const Color(0xdd535353),
                  textColor: Colors.white,
                  onPressed: registerUser,
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.blueAccent,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

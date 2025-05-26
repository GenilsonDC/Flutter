import 'package:flutter/material.dart';
import 'package:flash_chat_firebase/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.ref(); // Referência do Realtime DB
  late User loggedInUser;
  final TextEditingController messageController = TextEditingController();
  String messageText = '';

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print("Erro ao buscar usuário: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao buscar usuário")),
      );
    }
  }

  Future<void> sendMessage() async {
    FocusScope.of(context).unfocus(); // Fecha o teclado
    if (messageText.trim().isEmpty) return;

    try {
      await _database.child('flash_chat').push().set({
        'text': messageText,
        'sender': loggedInUser.email,
      });

      messageController.clear();
      setState(() {
        messageText = '';
      });
    } catch (e) {
      print("Erro ao enviar mensagem: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao enviar mensagem")),
      );
    }
  }

  void logout() async {
    try {
      await _auth.signOut();
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao sair")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('⚡')),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: logout,
            tooltip: 'Sair',
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: bgcolor,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(), // Aqui vai a exibição das mensagens depois
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        onChanged: (value) {
                          setState(() {
                            messageText = value;
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Digite sua ⚡ mensagem...',
                          hintStyle: const TextStyle(color: Color(0xff6c6c6c)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Transform.rotate(
                      angle: -0.4,
                      child: IconButton(
                        icon: const Icon(Icons.send_outlined),
                        color: Colors.lightBlueAccent,
                        iconSize: 32,
                        onPressed: sendMessage,
                        tooltip: 'Enviar',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

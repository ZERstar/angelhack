import 'package:flutter/material.dart';

import '../models/chatbot_model.dart';
import '../services/chatbot_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ChatBotModel> messages = [];

  void sendMessage(String message) async {
    try {
      ChatBotModel response = await ChatBotService.sendMessage(message);
      setState(() {
        messages.add(response);
      });
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Enter your message"),
                content: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: "Type here..."),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text("Send"),
                    onPressed: () {
                      String message = _controller.text;
                      sendMessage(message);
                      _controller.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}

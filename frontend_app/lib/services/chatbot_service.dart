import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/prod.dart';
import '../models/chatbot_model.dart';

class ChatBotService {

  static Future<ChatBotModel> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/generate'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'question': message,
      }),
    );

    if (response.statusCode == 200) {
      return ChatBotModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to send message');
    }
  }
}

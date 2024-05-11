import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/config_prod.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  fetchData() async {
    final response = await http.get(
      Uri.parse('${AppConfig.baseUrl}/user'),
    );
    debugPrint('this is the response ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

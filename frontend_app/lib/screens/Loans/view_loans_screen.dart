import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/config_prod.dart';
import 'package:http/http.dart' as http;
import '../../widgets/constants/colors.dart';
import '../../widgets/constants/texts.dart';

class AllLoanScreen extends StatefulWidget {
  final String user_id;
  const AllLoanScreen({super.key, required this.user_id});

  @override
  State<AllLoanScreen> createState() => _AllLoanScreenState();
}

class _AllLoanScreenState extends State<AllLoanScreen> {
  fetchLoans() async {
    const url = '${AppConfig.baseUrl}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load loans');
    }
  }

  @override
  Widget build(BuildContext context) {
    String userId = widget.user_id;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'All Loans',
            style: h1TextStyle.copyWith(color: textBlack),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        body: Container());
  }
}

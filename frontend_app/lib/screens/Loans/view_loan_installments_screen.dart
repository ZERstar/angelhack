import 'package:flutter/material.dart';

class InstallmentScreen extends StatefulWidget {
  const InstallmentScreen({super.key});

  @override
  State<InstallmentScreen> createState() => _InstallmentScreenState();
}

class _InstallmentScreenState extends State<InstallmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Installments'),
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
    );
  }
}
import 'package:flutter/material.dart';

class IApage extends StatelessWidget {
  const IApage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/assets/lia_logo.png', // Substitua pelo caminho correto da sua imagem
          height: 40,
        ),
        backgroundColor: const Color(0xFF50723C),
      ),
      body: Center(
        child: Text(
          ' IA',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

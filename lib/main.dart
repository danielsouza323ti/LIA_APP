import 'package:flutter/material.dart';
import 'liahome_page_widget.dart'; // Certifique-se de que o nome do arquivo esteja correto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LIAhomePAGEWidget(), // A tela inicial do seu aplicativo
    );
  }
}

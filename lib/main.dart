import 'package:flutter/material.dart';
import 'liahome_page_widget.dart';
import 'dicionario_screen.dart';  

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
      home: LIAhomePAGEWidget(),
      routes: {
        '/books': (context) => BookScreen(), 
      },
    );
  }
}

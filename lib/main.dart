import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Suzana Martins',
      home: MyMain(),
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF9CCFF),
        appBarTheme: AppBarThemeData(backgroundColor: Color(0xFFF2A3FF)),
      ),
    ),
  );
}

class MyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Olá, Mundo!')),
      body: Principal(),
    );
  }
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('teste'));
  }
}

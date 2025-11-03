import 'package:flutter/material.dart';
import 'package:portifolio_suzanamartins/header.dart';
import 'sobremim.dart';
import 'Template.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Suzana Martins',
      home: MyMain(),
      theme: ThemeData(
        scaffoldBackgroundColor: kFundo,
        appBarTheme: AppBarThemeData(backgroundColor: kAppBar),
      ),
    ),
  );
}

class MyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 100, title: TitleAppBar()),
      body: Principal(),
    );
  }
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Container(child: Sobremim()));
  }
}

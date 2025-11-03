import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio_suzanamartins/header.dart';
import 'package:portifolio_suzanamartins/projeto.dart';
import 'package:portifolio_suzanamartins/projetos.dart';
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
      appBar: AppBar(
        toolbarHeight: 100,
        title: TitleAppBar(),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            print("Botão do lado esquerdo clicado");
          },
        ),
      ),
      body: Principal(),
    );
  }
}

class Principal extends StatefulWidget {
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(child: Column(children: [Sobremim(), Projetos()])),
    );
  }
}

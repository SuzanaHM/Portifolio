import 'package:flutter/material.dart';
import 'package:portifolio_suzanamartins/header.dart';
import 'package:portifolio_suzanamartins/projeto.dart';
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

class Principal extends StatefulWidget {
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final Projeto _p = Projeto(
    data: 'teste',
    desc: 'descrição',
    habilidades: [Habilidade.AndroidApps, Habilidade.C],
    nome: 'Teste App',
    github: 'https://google.com',
    applestore: 'https://y8.com',
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _p.popup(context);
              },
              child: Text('Abrir Dialog'),
            ),
            Sobremim(),
          ],
        ),
      ),
    );
  }
}

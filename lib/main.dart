import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Widgets/DrawerMenu.dart';
import 'header.dart';
import 'projeto.dart';
import 'projetos.dart';
import 'sobremim.dart';
import 'Template.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Suzana Martins',
      home: MyPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: kFundo,
        appBarTheme: AppBarThemeData(backgroundColor: kAppBar),
      ),
    ),
  );
}

class MyPage extends StatefulWidget {
  MyPage({this.pagina});
  final Widget? pagina;

  @override
  State<MyPage> createState() => _MyPageState(pagina: pagina);
}

class _MyPageState extends State<MyPage> {
  _MyPageState({this.pagina});
  final Widget? pagina;

  bool _drawer = false;

  @override
  Widget build(BuildContext context) {
    Widget pg = pagina != null ? pagina! : Sobremim();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: TitleAppBar(),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            setState(() {
              _drawer = !_drawer;
            });
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(child: Container(child: pg)),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Drawermenu(aberto: _drawer),
          ),
        ],
      ),
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

import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  final TextStyle _titulo = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final TextStyle _tituloStroke = TextStyle(
    fontSize: 35,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.black26,
  );

  final TextStyle _subtitulo = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final TextStyle _subtituloStroke = TextStyle(
    fontSize: 18,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.black26,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Text('Suzana Martins', style: _titulo),
              Text('Suzana Martins', style: _tituloStroke),
            ],
          ),
          Stack(
            children: [
              Text('Programadora', style: _subtitulo),
              Text('Programadora', style: _subtituloStroke),
            ],
          ),
        ],
      ),
    );
  }
}

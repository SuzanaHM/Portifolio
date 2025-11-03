import 'package:flutter/material.dart';
import 'Template.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sobremim extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  final double size = 120;

  Container getHabilidade(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Container getHabilidadeCSharp() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.c, color: Colors.white, size: 40),
                Icon(FontAwesomeIcons.hashtag, color: Colors.white, size: 15),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'C Sharp',
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 25),
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            CircleAvatar(
              radius: 150,
              foregroundImage: AssetImage('imagens/me.png'),
            ),
            CircleAvatar(radius: 154, backgroundColor: Colors.black26),
          ],
        ),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: kWindowColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sobre Mim',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              SizedBox(height: 20),
              Text(
                '     Olá! Sou Suzana, desenvolvedora apaixonada por tecnologia e por criar soluções que realmente fazem a diferença. Tenho experiência com diversas linguagens e ferramentas, incluindo Java, JavaScript, C#, C, HTML5, CSS e Flutter, o que me permite atuar em diferentes áreas do desenvolvimento — desde o backend até interfaces modernas e responsivas.',
                style: _textStyle,
              ),
              SizedBox(height: 10),
              Text(
                '     Gosto de aprender continuamente e explorar novas tecnologias, buscando sempre escrever códigos limpos, eficientes e de fácil manutenção. Acredito que cada projeto é uma oportunidade de crescimento, tanto técnico quanto pessoal, e adoro transformar ideias em algo funcional e visualmente agradável.',
                style: _textStyle,
              ),
              SizedBox(height: 10),
              Text(
                '     Meu foco é desenvolver aplicações que unam boa performance, design intuitivo e experiência do usuário de qualidade. Estou sempre aberta a novos desafios e colaborações que me permitam evoluir e contribuir com o que sei.',
                style: _textStyle,
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: kWindowColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Habilidades',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  getHabilidade(FontAwesomeIcons.java, 'Java'),
                  getHabilidade(FontAwesomeIcons.html5, 'HTML'),
                  getHabilidade(FontAwesomeIcons.css3, 'CSS'),
                  getHabilidade(FontAwesomeIcons.js, 'JS'),
                  getHabilidade(FontAwesomeIcons.nodeJs, 'Node.js'),
                  getHabilidade(FontAwesomeIcons.c, 'C'),
                  getHabilidadeCSharp(),
                  getHabilidade(FontAwesomeIcons.flutter, 'Flutter'),
                  getHabilidade(FontAwesomeIcons.dartLang, 'Dart'),
                  getHabilidade(FontAwesomeIcons.unity, 'Unity'),
                  getHabilidade(FontAwesomeIcons.android, 'Android Apps'),
                  getHabilidade(FontAwesomeIcons.cube, 'Minecraft Plugin'),
                  getHabilidade(FontAwesomeIcons.cube, 'Minecraft Servidor'),
                  getHabilidade(FontAwesomeIcons.database, 'MySQL'),
                  getHabilidade(FontAwesomeIcons.google, 'Firebase'),
                  getHabilidade(FontAwesomeIcons.git, 'Git'),
                  getHabilidade(FontAwesomeIcons.github, 'GitHub'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

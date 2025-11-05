import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Template.dart';
import 'Widgets/Galeria.dart';
import 'package:url_launcher/url_launcher.dart';

class Projeto {
  final List<Habilidade> habilidades;
  final String nome;
  final String desc;
  final String data;
  final List<ImageProvider> imagens;
  final String github;
  final String website;
  final String playstore;
  final String applestore;
  final String download;
  Projeto({
    required this.habilidades,
    required this.nome,
    required this.desc,
    required this.data,
    required this.imagens,
    String this.github = '',
    String this.website = '',
    String this.playstore = '',
    String this.applestore = '',
    String this.download = '',
  });

  TextButton _Botao(String nome, String url) {
    return TextButton(
      onPressed: () async {
        final Uri _url = Uri.parse(url);
        if (await canLaunchUrl(_url)) {
          await launchUrl(_url);
        } else {
          throw 'Could not launch $url';
        }
      },
      style: TextButton.styleFrom(backgroundColor: Colors.black87),
      child: Text(
        nome,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget getHabilidade(Habilidade h) {
    IconData icon;
    IconData? icon2;
    String nome;

    switch (h) {
      case Habilidade.Java:
        icon = FontAwesomeIcons.java;
        nome = 'Java';
        break;
      case Habilidade.HTML:
        icon = FontAwesomeIcons.html5;
        nome = 'HTML';
        break;
      case Habilidade.CSS:
        icon = FontAwesomeIcons.css3;
        nome = 'CSS';
        break;
      case Habilidade.JS:
        icon = FontAwesomeIcons.js;
        nome = 'JS';
        break;
      case Habilidade.NodeJS:
        icon = FontAwesomeIcons.nodeJs;
        nome = 'Node.js';
        break;
      case Habilidade.C:
        icon = FontAwesomeIcons.c;
        nome = 'C';
        break;
      case Habilidade.CSharp:
        icon = FontAwesomeIcons.c;
        icon2 = FontAwesomeIcons.hashtag;
        nome = 'C Sharp';
        break;
      case Habilidade.Flutter:
        icon = FontAwesomeIcons.flutter;
        nome = 'Flutter';
        break;
      case Habilidade.Dart:
        icon = FontAwesomeIcons.dartLang;
        nome = 'Dart';
        break;
      case Habilidade.Unity:
        icon = FontAwesomeIcons.unity;
        nome = 'Unity';
        break;
      case Habilidade.AndroidApps:
        icon = FontAwesomeIcons.android;
        nome = 'Android Apps';
        break;
      case Habilidade.MinecraftPlugin:
        icon = FontAwesomeIcons.cube;
        nome = 'Minecraft Plugin';
        break;
      case Habilidade.MinecraftServidor:
        icon = FontAwesomeIcons.cube;
        nome = 'Minecraft Servidor';
        break;
      case Habilidade.MySQL:
        icon = FontAwesomeIcons.database;
        nome = 'MySQL';
        break;
      case Habilidade.Firebase:
        icon = FontAwesomeIcons.google;
        nome = 'Firebase';
        break;
      case Habilidade.Git:
        icon = FontAwesomeIcons.git;
        nome = 'Git';
        break;
      case Habilidade.GitHub:
        icon = FontAwesomeIcons.github;
        nome = 'GitHub';
        break;
      case Habilidade.CriptografiaAES:
        icon = FontAwesomeIcons.shield;
        nome = 'Criptografia AES';
        break;
      case Habilidade.CriptografiaHash:
        icon = FontAwesomeIcons.fingerprint;
        nome = 'Criptografia Hash';
        break;
    }

    return Tooltip(
      message: nome,
      child: Container(
        margin: EdgeInsets.all(4),
        width: 25,
        height: 25,
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.black38),
            if (icon2 != null) Icon(icon2!, size: 5, color: Colors.black38),
          ],
        ),
      ),
    );
  }

  void popup(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: kWindowColor,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          FontAwesomeIcons.xmark,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      nome,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      data,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Wrap(
                      runSpacing: 5,
                      spacing: 5,
                      children: [
                        for (Habilidade h in habilidades) getHabilidade(h),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(flex: 1, child: Galeria(imagens: imagens)),
                        SizedBox(width: 20),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.topLeft,
                            child: Text(desc),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Wrap(
                      runSpacing: 5,
                      spacing: 5,
                      children: [
                        if (website.isNotEmpty) _Botao("Visitar", website),
                        if (github.isNotEmpty) _Botao("GitHub", github),
                        if (playstore.isNotEmpty)
                          _Botao("PlayStore", playstore),
                        if (applestore.isNotEmpty)
                          _Botao("AppleStore", applestore),
                        if (download.isNotEmpty) _Botao("Download", download),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

enum Habilidade {
  Java,
  HTML,
  CSS,
  JS,
  NodeJS,
  C,
  CSharp,
  Flutter,
  Dart,
  Unity,
  AndroidApps,
  MinecraftPlugin,
  MinecraftServidor,
  MySQL,
  Firebase,
  Git,
  GitHub,
  CriptografiaAES,
  CriptografiaHash,
}

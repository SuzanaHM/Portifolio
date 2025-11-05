import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Template.dart';
import 'projeto.dart';

List<Projeto> projetos = [
  Projeto(
    data: '03/11/2025',
    desc: 'Este é meu portifolio',
    habilidades: [Habilidade.AndroidApps, Habilidade.C],
    nome: 'Portifolio de Suzana Martins',
    imagens: [
      AssetImage('imagens/me.png'),
      AssetImage('imagens/img.png'),
      AssetImage('imagens/img_1.png'),
      AssetImage('imagens/img_2.png'),
    ],
    github: 'https://google.com',
    applestore: 'https://y8.com',
  ),
  Projeto(
    data: '03/11/2025',
    desc: 'Este é meu portifolio',
    habilidades: [Habilidade.AndroidApps, Habilidade.C, Habilidade.CSS],
    nome: 'Portifolio de Suzana Martins',
    imagens: [
      AssetImage('imagens/me.png'),
      AssetImage('imagens/img.png'),
      AssetImage('imagens/img_1.png'),
      AssetImage('imagens/img_2.png'),
    ],
    github: 'https://google.com',
    applestore: 'https://y8.com',
  ),
  Projeto(
    data: '03/11/2025',
    desc: 'Este é meu portifolio',
    habilidades: [Habilidade.CSS],
    nome: 'Portifolio de Suzana Martins',
    imagens: [
      AssetImage('imagens/me.png'),
      AssetImage('imagens/img.png'),
      AssetImage('imagens/img_1.png'),
      AssetImage('imagens/img_2.png'),
    ],
    github: 'https://google.com',
    applestore: 'https://y8.com',
  ),
  Projeto(
    data: '03/11/2025',
    desc: 'Este é meu portifolio',
    habilidades: [Habilidade.CSS, Habilidade.CSharp],
    nome: 'Portifolio de Suzana Martins',
    imagens: [
      AssetImage('imagens/me.png'),
      AssetImage('imagens/img.png'),
      AssetImage('imagens/img_1.png'),
      AssetImage('imagens/img_2.png'),
    ],
    github: 'https://google.com',
    applestore: 'https://y8.com',
  ),
];

class Projetos extends StatefulWidget {
  @override
  State<Projetos> createState() => _ProjetosState();
}

class _ProjetosState extends State<Projetos> {
  List<Projeto> proj = List.from(projetos);
  Habilidade? selectH;

  void find(String busca) {
    setState(() {
      if (busca.isEmpty) {
        proj = List.from(projetos);
      } else {
        proj = projetos
            .where((p) => p.nome.toLowerCase().contains(busca.toLowerCase()))
            .toList();
      }

      if (selectH != null) {
        proj = proj.where((p) => p.habilidades.contains(selectH)).toList();
      }
    });
  }

  void findH(Habilidade h) {
    setState(() {
      if (selectH == h) {
        selectH = null;
      } else {
        selectH = h;
      }

      // Aplica filtro de habilidade
      proj = List.from(projetos);
      if (selectH != null) {
        proj = proj.where((p) => p.habilidades.contains(selectH)).toList();
      }
    });
  }

  Widget Botao(Habilidade h) {
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

    return TextButton(
      onPressed: () => findH(h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: Colors.black38),
          if (icon2 != null) Icon(icon2!, size: 5, color: Colors.black38),
          SizedBox(width: 8),
          Text(nome),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: kWindowColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Projetos',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.white70,
            child: TextField(
              onChanged: find,
              decoration: InputDecoration(hintText: 'Pesquisar...'),
            ),
          ),
          SizedBox(height: 25),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 5,
            runSpacing: 5,
            children: [for (Habilidade h in Habilidade.values) Botao(h)],
          ),
          SizedBox(height: 25),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: proj
                .map(
                  (p) => ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 280, // limite de largura
                      minWidth: 150, // evita ficar pequeno demais
                    ),
                    child: ProjetoView(projeto: p),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ProjetoView extends StatefulWidget {
  const ProjetoView({required this.projeto, super.key});
  final Projeto projeto;

  @override
  State<ProjetoView> createState() => _ProjetoViewState();
}

class _ProjetoViewState extends State<ProjetoView> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.projeto;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        scale: _hover ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: GestureDetector(
          onTap: () => p.popup(context),
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kAppBar,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // evita overflow
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Imagem com altura fixa proporcional
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(image: p.imagens[0], fit: BoxFit.cover),
                  ),
                ),

                // Conteúdo textual
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // evita expansão
                    children: [
                      Text(
                        p.nome,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        p.data,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

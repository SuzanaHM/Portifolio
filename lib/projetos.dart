import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Template.dart';
import 'projeto.dart';

List<Projeto> projetos = [
  Projeto(
    data: '03/11/2025',
    nome: 'Portfólio de Suzana Martins',
    desc:
        "O Meu Portfólio Web é uma aplicação desenvolvida com Flutter e Dart, criada para apresentar meus projetos, experiências e habilidades de forma elegante, moderna e responsiva.\nConstruído com Flutter Web, o site oferece desempenho nativo, animações fluidas e um design totalmente adaptável para diferentes dispositivos e tamanhos de tela.\n\nO projeto foi planejado para ser tanto uma vitrine profissional quanto uma demonstração prática das minhas competências técnicas.",
    habilidades: [Habilidade.Dart, Habilidade.Flutter, Habilidade.GitHub],
    imagens: [
      AssetImage('imagens/portfoliosuzanamartins_1.png'),
      AssetImage('imagens/portfoliosuzanamartins_2.png'),
      AssetImage('imagens/portfoliosuzanamartins_3.png'),
      AssetImage('imagens/portfoliosuzanamartins_4.png'),
      AssetImage('imagens/portfoliosuzanamartins_5.png'),
    ],
    github: 'https://github.com/SuzanaHM/Portifolio',
    website: 'https://suzanamartins.web.app/',
  ),
  Projeto(
    data: '26/11/2017',
    nome: 'Plugin StackMobs 1.12.x',
    desc:
        "O StackMobs é um plugin desenvolvido para servidores Bukkit/Spigot que tem como objetivo reduzir o lag causado por grandes quantidades de mobs e, ao mesmo tempo, trazer uma mecânica inteligente e personalizável de empilhamento de criaturas.\n\nCom ele, mobs do mesmo tipo são agrupados automaticamente em um único corpo, exibindo uma tag visual com a quantidade total. Isso reduz drasticamente a carga de entidades ativas no servidor, melhorando o desempenho sem comprometer a jogabilidade.\n\nAlém disso, ao eliminar um mob empilhado, o jogador recebe drops e experiência equivalentes à quantidade total de criaturas presentes naquele grupo — mantendo o equilíbrio entre performance e recompensa.",
    habilidades: [Habilidade.Java, Habilidade.MinecraftPlugin],
    imagens: [
      AssetImage('imagens/stackmobs_1.png'),
      AssetImage('imagens/stackmobs_2.png'),
      AssetImage('imagens/stackmobs_3.png'),
      AssetImage('imagens/stackmobs_4.png'),
    ],
    website: 'https://dev.bukkit.org/projects/stackmobs',
    download: 'https://dev.bukkit.org/projects/stackmobs/files',
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

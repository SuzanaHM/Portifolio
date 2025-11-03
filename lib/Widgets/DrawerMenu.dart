import 'package:flutter/material.dart';
import 'package:portifolio_suzanamartins/contato.dart';
import 'package:portifolio_suzanamartins/main.dart';
import 'package:portifolio_suzanamartins/projetos.dart';
import 'package:portifolio_suzanamartins/sobremim.dart';

class Drawermenu extends StatefulWidget {
  const Drawermenu({required this.aberto, Key? key}) : super(key: key);

  final bool aberto;

  @override
  State<Drawermenu> createState() => _DrawermenuState();
}

class _DrawermenuState extends State<Drawermenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _widthAnimation = Tween<double>(
      begin: 0,
      end: 150,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.aberto) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(Drawermenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.aberto) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: _widthAnimation.value,
          height: MediaQuery.of(context).size.height,
          color: Colors.white54,
          child: _widthAnimation.value == 0
              ? null
              : ListView(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  children: [
                    _buildMenuItem('Sobre Mim'),
                    _buildMenuItem('Projetos'),
                    _buildMenuItem('Contato'),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildMenuItem(String title) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.black)),
      onTap: () {
        Widget pg = Sobremim();
        switch (title) {
          case 'Projetos':
            pg = Projetos();
            break;
          case 'Contato':
            pg = Contato();
            break;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MyPage(pagina: pg);
            },
          ),
        );
      },
    );
  }
}

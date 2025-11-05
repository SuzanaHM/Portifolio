import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Galeria extends StatefulWidget {
  const Galeria({required this.imagens, super.key});

  final List<ImageProvider> imagens;

  @override
  State<Galeria> createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  int select = 0;

  int getPrev() {
    if (widget.imagens.length == 1) return -1;
    if (select - 1 < 0) return widget.imagens.length - 1;
    return select - 1;
  }

  int getNext() {
    if (widget.imagens.length == 1) return -1;
    if (select >= widget.imagens.length - 1) return 0;
    return select + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Imagem principal
          Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(color: Colors.black26),
              ),
              Image(
                width: double.infinity,
                image: widget.imagens[select],
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Linha de miniaturas e botões
          LayoutBuilder(
            builder: (context, constraints) {
              // Define o tamanho máximo de cada miniatura
              double thumbSize = constraints.maxWidth / 8;
              if (thumbSize > 60) thumbSize = 60; // limita o tamanho máximo
              if (thumbSize < 35) thumbSize = 35; // evita miniaturas minúsculas

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      setState(() {
                        if (getPrev() != -1) select = getPrev();
                      });
                    },
                    child: const Icon(
                      FontAwesomeIcons.lessThan,
                      color: Colors.white,
                    ),
                  ),

                  // Usamos Flexible para distribuir o espaço das miniaturas
                  Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(
                      height: 80, // define altura das miniaturas
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (getPrev() != -1 && getPrev() != getNext())
                            _miniatura(widget.imagens[getPrev()], thumbSize),
                          _miniatura(
                            widget.imagens[select],
                            thumbSize,
                            destaque: true,
                          ),
                          if (getPrev() != -1)
                            _miniatura(widget.imagens[getNext()], thumbSize),
                        ],
                      ),
                    ),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      setState(() {
                        if (getNext() != -1) select = getNext();
                      });
                    },
                    child: const Icon(
                      FontAwesomeIcons.greaterThan,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _miniatura(ImageProvider img, double size, {bool destaque = false}) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: destaque ? Border.all(color: Colors.white, width: 2) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(image: img, fit: BoxFit.cover),
      ),
    );
  }
}

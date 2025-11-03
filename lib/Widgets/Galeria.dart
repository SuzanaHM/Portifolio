import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Galeria extends StatefulWidget {
  Galeria({required this.imagens});

  final List<ImageProvider> imagens;

  @override
  State<Galeria> createState() => _GaleriaState(imagens: imagens);
}

class _GaleriaState extends State<Galeria> {
  _GaleriaState({required this.imagens});

  final List<ImageProvider> imagens;

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
        children: [
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () {
                  setState(() {
                    if (getNext() != -1) select = getPrev();
                  });
                },
                child: Icon(FontAwesomeIcons.lessThan, color: Colors.white),
              ),
              if (getPrev() != -1 && getPrev() != getNext())
                Container(
                  margin: EdgeInsets.all(4),
                  height: 50,
                  width: 50,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image(
                      image: widget.imagens[getPrev()],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.all(4),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image(image: widget.imagens[select], fit: BoxFit.fill),
                ),
              ),
              if (getPrev() != -1)
                Container(
                  margin: EdgeInsets.all(4),
                  height: 50,
                  width: 50,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image(
                      image: widget.imagens[getNext()],
                      fit: BoxFit.fill,
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
                child: Icon(FontAwesomeIcons.greaterThan, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

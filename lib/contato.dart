import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio_suzanamartins/Template.dart';
import 'package:url_launcher/url_launcher.dart';

class Contato extends StatelessWidget {
  const Contato({Key? key}) : super(key: key);

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
            'Contato',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () async {
                    final Uri _url = Uri.parse(
                      'https://wa.me/5551989852085?text=Ol%C3%A1%2C%20Vim%20pelo%20seu%20Portfolio!',
                    );
                    if (await canLaunchUrl(_url)) {
                      await launchUrl(_url);
                    } else {
                      throw 'Could not launch $_url';
                    }
                  },
                  child: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    size: 100,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () async {
                    final String email = 'suzanahannahmartins@gmail.com';
                    final String subject = Uri.encodeComponent(
                      'Contato via Portfólio',
                    );
                    final String body = Uri.encodeComponent(
                      'Escreva aqui sua mensagem',
                    );

                    final String mailtoLink =
                        'mailto:$email?subject=$subject&body=$body';

                    final Uri _url = Uri.parse(mailtoLink);
                    if (await canLaunchUrl(_url)) {
                      await launchUrl(_url);
                    } else {
                      throw 'Could not launch $_url';
                    }
                  },
                  child: Icon(
                    FontAwesomeIcons.envelope,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Clipboard.setData(
                ClipboardData(text: 'suzanahannahmartins@gmail.com'),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email copiado para a área de transferência!'),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('EMAIL'),
                  Text('Suzanahannahmartins@gmail.com'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

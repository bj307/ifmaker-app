import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/components/card_dash.dart';
import 'package:ifmaker_app/src/dashboard/ponto/qr_code_ponto.dart';
import 'package:ifmaker_app/src/config/app_data.dart' as app_data;

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //ola usuario
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 22),
            child: Align(
              alignment: Alignment.topLeft,
              child:
                  Text.rich(TextSpan(style: TextStyle(fontSize: 20), children: [
                TextSpan(
                    text: 'Olá, Usuário',
                    style: TextStyle(
                        color: Color(0xFF474747), fontWeight: FontWeight.bold))
              ])),
            ),
          ),
          //grid 3 cards
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 6),
              itemCount: app_data.cards.length,
              itemBuilder: (_, index) {
                return CardDash(
                  info: app_data.cards[index],
                );
              },
            ),
          )
        ],
      ),

      // Conteúdo do corpo da tela (pode ser outro widget)

      //botao qr code
      bottomNavigationBar: Container(
        height: 80,
        // O container para centralizar horizontalmente o ícone
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (c) {
                return const QrCodePonto();
              }));
            },
            child: Container(
              width: 60, // Largura do ícone (ajuste conforme necessário)
              height: 60, // Altura do ícone (ajuste conforme necessário)
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 187, 187, 187), blurRadius: 2)
                ], // Cor de fundo
                borderRadius:
                    BorderRadius.circular(15), // Metade da largura/altura
              ),
              child: const Icon(
                Icons.qr_code,
                color: Colors.green,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

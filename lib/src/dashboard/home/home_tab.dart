import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/components/card_dash.dart';
import 'package:ifmaker_app/src/components/project_card.dart';
//import 'package:ifmaker_app/src/dashboard/ponto/qr_code_ponto.dart';
import 'package:ifmaker_app/src/config/app_data.dart' as app_data;
import 'package:ifmaker_app/src/dashboard/page_base.dart' as page_base;

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
            flex: 1,
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width < 600 ? 9 / 6 : MediaQuery.of(context).size.width / 200),
              itemCount: app_data.cards.length,
              itemBuilder: (_, index) {
                return CardDash(
                  info: app_data.cards[index],
                );
              },
            ),
          ),

          //projetos
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 218, 216, 216),
                            blurRadius: 4)
                      ], // Cor de fundo
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: MediaQuery.of(context).size.width > 600 ? 1 : 1,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(12, 12, 0, 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Meus Projetos',
                                style: TextStyle(
                                    color: Color(0xFF4CB050),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: MediaQuery.of(context).size.width > 600 ? 5 : 6,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: MediaQuery.of(context).size.width > 600 ? MediaQuery.of(context).size.width / 100 : 9 / 2),
                                itemCount: app_data.projects.length,
                                itemBuilder: (_, index) {
                                  return ProjetoCard(
                                      project: app_data.projects[index]);
                                })),
                      ],
                    )),
              ))
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
              page_base.PageBase.changePage(context, 1);

              // Navigator.of(context)
              //     .pushReplacement(MaterialPageRoute(builder: (c) {
              //   return const QrCodePonto();
              // }));
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

import 'package:flutter/material.dart';

class AppBarComponent extends StatefulWidget {
  const AppBarComponent({super.key});

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      
        actions: [
          //menu
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              // onTap: () {
              //   setState(() {
              //     currencyIndex = 0;
              //     pageController.jumpToPage(currencyIndex);
              //   });
              // }, //abre menu
              child: Container(
                width: 40, // Largura do ícone (ajuste conforme necessário)
                height: 40, // Altura do ícone (ajuste conforme necessário)
                decoration: BoxDecoration(
                  color: Colors.green, // Cor de fundo
                  borderRadius:
                      BorderRadius.circular(7), // Metade da largura/altura
                ),
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          //perfil
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {}, //navega para o perfil
              child: Container(
                width: 40, // Largura do ícone (ajuste conforme necessário)
                height: 40, // Altura do ícone (ajuste conforme necessário)
                decoration: BoxDecoration(
                  color: Colors.green, // Cor de fundo
                  borderRadius:
                      BorderRadius.circular(50), // Metade da largura/altura
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
    );
  }
}
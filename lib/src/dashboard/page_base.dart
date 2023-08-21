import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/dashboard/home/home_tab.dart';

class PageBase extends StatefulWidget {
  const PageBase({super.key});

  @override
  State<PageBase> createState() => _PageBaseState();
}

class _PageBaseState extends State<PageBase> {
  int currencyIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        actions: [
          //menu
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: () {}, //abre menu
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
          //IconButton(onPressed: () {}, icon: const Icon(Icons.person))
        ],
      ),

      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [HomeTab()],
      ),
    );
  }
}

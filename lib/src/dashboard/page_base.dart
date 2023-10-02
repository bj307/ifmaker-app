import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/dashboard/home/home_tab.dart';
import 'package:ifmaker_app/src/dashboard/ponto/qr_code_ponto.dart';
import 'package:ifmaker_app/src/data/storage/session_storage.dart';
import 'dart:convert';

class PageBase extends StatefulWidget {
  const PageBase({super.key});
  @override
  State<PageBase> createState() => _PageBaseState();

  static void changePage(BuildContext context, int newIndex) {
    final state = context.findAncestorStateOfType<_PageBaseState>();
    if (state != null) {
      state.changePage(newIndex);
    }
  }
}

class _PageBaseState extends State<PageBase> {
  int currencyIndex = 0;
  final pageController = PageController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void changePage(int index) {
    setState(() {
      currencyIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    String jwt = SessionStorageHelper.getValue("jwtPayload");
    jwt = jwt
        .replaceAll(':', '":"')
        .replaceAll(',', '","')
        .replaceAll('{', '{"')
        .replaceAll('}', '"}')
        .replaceAll(' ', '');
    Map<String, dynamic> jsonData = jsonDecode(jwt);

    String id = jsonData['id'];
    String nome = jsonData['nome'];
    String jwtToken = jsonData['jwtToken'];
    String email = jsonData['email'];

    return Scaffold(
      key: scaffoldKey,
      //appbar
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
          child: GestureDetector(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
              print(nome);
              //abre menu lateral drawer
            },
            child: Container(
              // width: 40, // Largura do ícone (ajuste conforme necessário)
              // height: 40, // Altura do ícone (ajuste conforme necessário)
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
        actions: [
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
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Text(nome),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Pagina 1'),
              // onTap: () {
              //   print()
              // },
            ),
            const ListTile(
              leading: Icon(Icons.plus_one_outlined),
              title: Text('Pagina 2'),
              // onTap: () {

              // },
            )
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeTab(),
          QrCodePonto(),
        ],
      ),
    );
  }
}

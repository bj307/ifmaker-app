import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/dashboard/ponto/qr_code_ponto.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(), // Conteúdo do corpo da tela (pode ser outro widget)
      bottomNavigationBar: Container(
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

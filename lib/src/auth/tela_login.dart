import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/components/custom_text_field.dart';
import 'package:ifmaker_app/src/dashboard/page_base.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          // Parte superior ocupando 25% da tela com um polígono personalizado
          Container(
            height: MediaQuery.of(context).size.height *
                0.25, // 25% da altura da tela
            child: Stack(
              children: [
                // Desenha o polígono
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.25),
                  painter: MyPainter(),
                ),

                //header logo
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(
                          style: TextStyle(
                            fontSize: 40,
                          ),
                          //Titulo/logo
                          children: [
                            TextSpan(
                                text: 'IF',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: 'Maker',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 241, 28, 13),
                                  fontWeight: FontWeight.bold,
                                ))
                          ])),
                      Text.rich(TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          //campus
                          children: [
                            TextSpan(
                                text: 'by Campus Urutaí',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500))
                          ]))
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Parte inferior ocupando 75% da tela
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width > 600 ? 600 : null,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //titulo login
                  const Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 40),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                          TextSpan(style: TextStyle(fontSize: 26), children: [
                        TextSpan(
                            text: 'Faça Login',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ))
                      ])),
                    ),
                  ),
                  //email
                  const CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                  ),
                  //senha
                  const CustomTextField(
                    icon: Icons.lock,
                    label: 'Senha',
                    isSecret: true,
                  ),
                  //botao Entrar
                  SizedBox(
                      height: 45,
                      width: 120,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor:
                                  const Color.fromARGB(255, 241, 28, 13),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (c) {
                              return const PageBase();
                            }));
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green // Cor do polígono
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0) // Canto superior esquerdo
      ..lineTo(0, size.height) // Canto inferior esquerdo
      ..lineTo(size.width,
          size.height * 0.75) // Canto inferior direito (75% da altura)
      ..lineTo(size.width, 0) // Canto superior direito
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

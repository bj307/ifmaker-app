import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/auth/components/custom_text_field.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(children: [
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(TextSpan(
                  style: TextStyle(
                    fontSize: 40,
                  ),
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
                  children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500))
                  ]))
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 40,
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(children: [
              CustomTextField(
                icon: Icons.email,
                label: 'Email',
              ),
              CustomTextField(
                icon: Icons.lock,
                label: 'Senha',
                isSecret: true,
              )
            ]),
          ),
        )
      ]),
    );
  }
}

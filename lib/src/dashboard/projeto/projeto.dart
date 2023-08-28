import 'package:flutter/material.dart';

class ProjetoPage extends StatefulWidget {
  const ProjetoPage({super.key, required this.nome});
  final String nome;

  @override
  State<ProjetoPage> createState() => _ProjetoPageState();
}

class _ProjetoPageState extends State<ProjetoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          decoration: const BoxDecoration(color: Colors.green),
          child: Expanded(
              child: Text(
            widget.nome,
            style: const TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}

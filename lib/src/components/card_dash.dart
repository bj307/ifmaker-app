import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/data/model/card_model.dart';

class CardDash extends StatelessWidget {
  final CardModel info;
  const CardDash({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.green,
      ),
      child: Column(children: [
        //nome
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            info.titulo,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        //dados
        Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    info.info,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                )))
      ]),
    );
  }
}

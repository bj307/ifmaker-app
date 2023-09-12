import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/components/app_bar.dart';
import 'package:ifmaker_app/src/data/model/card_model.dart';

class ProjetoPage extends StatefulWidget {
  const ProjetoPage({super.key, required this.projectInfo});
  final ProjetoCardModel projectInfo;
  
  @override
  State<ProjetoPage> createState() => _ProjetoPageState();
}

class _ProjetoPageState extends State<ProjetoPage> {
  String? teste;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarComponent(),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 22),
            child: Align(
              alignment: Alignment.topLeft,
              child:
                  Text.rich(TextSpan(style: TextStyle(fontSize: 20), children: [
                TextSpan(
                    text: widget.projectInfo.titulo,
                    style: TextStyle(
                        color: Color(0xFF474747), fontWeight: FontWeight.bold))
              ])),
            ),
          ),
        ],
      )
    );
  }
}

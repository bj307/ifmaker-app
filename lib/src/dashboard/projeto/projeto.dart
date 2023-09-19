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
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.projectInfo.titulo;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarComponent(),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 22),
            child: Align(
              alignment: Alignment.topLeft,
              child:
                  Text.rich(TextSpan(style: const TextStyle(fontSize: 20), children: [
                TextSpan(
                    text: title,
                    style: const TextStyle(
                        color: Color(0xFF474747), fontWeight: FontWeight.bold))
              ])),
            ),
          ),
        ],
      )
    );
  }
}

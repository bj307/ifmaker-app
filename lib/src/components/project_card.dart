
import 'package:flutter/material.dart';
import 'package:ifmaker_app/src/dashboard/projeto/projeto.dart';
import 'package:ifmaker_app/src/data/model/card_model.dart';

class ProjetoCard extends StatelessWidget {
  final ProjetoCardModel projectInfo;

  const ProjetoCard({super.key, required this.projectInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFFF3F3F3),
          border: Border.all(color: const Color(0xFF4CB050), width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      projectInfo.titulo,
                      style: const TextStyle(
                          color: Color(0xFF474747),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (c) {
                        return ProjetoPage(projectInfo: projectInfo);
                      })
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFF4CB050)),
                      child: const Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "Ver",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "projeto",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

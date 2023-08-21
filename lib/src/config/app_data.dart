import 'package:ifmaker_app/src/model/card_model.dart';

//cards infos
CardModel projetos = CardModel(titulo: "Projetos", info: "5");

CardModel online = CardModel(titulo: "Online", info: "3");

CardModel status = CardModel(titulo: "Ponto", info: "Aberto");

List<CardModel> cards = [projetos, online, status];

//cards projetos
ProjetoCardModel app = ProjetoCardModel(titulo: "APP Gerenciamento Maker");

ProjetoCardModel api = ProjetoCardModel(titulo: "Api Gerenciamento Maker");

ProjetoCardModel ui =
    ProjetoCardModel(titulo: "Minicurso de Introdução UI Design");

List<ProjetoCardModel> projects = [app, api, ui];

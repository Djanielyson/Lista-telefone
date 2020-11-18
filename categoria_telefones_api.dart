import 'package:flutter/services.dart' show rootBundle;
import 'package:teste/Atividade%20Ponto%20Extra/categoria_telefones.dart';
import 'dart:convert';


class CategoriaTelefonesAPI {
  static Future<List<CategoriaTelefones>> getCategoriaJsonLocal() async {
    List<CategoriaTelefones> categoriaTelefones = List<CategoriaTelefones>();


    String telefonesJsonString = await rootBundle.loadString("resource/json/telefones.json");

    List telefonesJson = json.decode(telefonesJsonString);

    categoriaTelefones = telefonesJson.map((map) => CategoriaTelefones.fromJson(map)).toList();

     categoriaTelefones.forEach((telefones) => print(telefones.categoria));


    return categoriaTelefones;
  }
  static Future<List<CategoriaTelefones>> getTelefonesJsonLocal() async {
    List<CategoriaTelefones> categoriaTelefones = List<CategoriaTelefones>();


    String telefonesJsonString = await rootBundle.loadString("resource/json/telefones.json");

    List telefonesJson = json.decode(telefonesJsonString);

    categoriaTelefones = telefonesJson.map((map) => CategoriaTelefones.fromJson(map)).toList();



    return categoriaTelefones;
  }

}
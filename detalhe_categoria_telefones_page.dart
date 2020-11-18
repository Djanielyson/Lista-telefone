import 'package:flutter/material.dart';
import 'package:teste/Atividade%20Ponto%20Extra/categoria_telefones.dart';


// ignore: must_be_immutable
class DetalheCategoriaTelefones extends StatelessWidget {
  CategoriaTelefones cattel;

  DetalheCategoriaTelefones({CategoriaTelefones categoria}) {
    this.cattel = categoria;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cattel.categoria),
        centerTitle: true
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              '${cattel.telefones.map((map) => map.toJson())}',

            ),
          ],
        ),
      ),
    );
  }
}
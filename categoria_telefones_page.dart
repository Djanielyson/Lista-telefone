import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste/Atividade%20Ponto%20Extra/categoria_telefones.dart';
import 'package:teste/Atividade%20Ponto%20Extra/detalhe_categoria_telefones_page.dart';

import 'categoria_telefones_api.dart';




class CategoriaTelefonesPage extends StatefulWidget {
  @override
  _CategoriaTelefonesPageState createState() => _CategoriaTelefonesPageState();
}

class _CategoriaTelefonesPageState extends State<CategoriaTelefonesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telefones CZ"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: CategoriaTelefonesAPI.getCategoriaJsonLocal(),
        builder: (BuildContext context, AsyncSnapshot snapshort) {
          if (snapshort.hasData) {
            return _buildListViewTelefones(snapshort.data);
          } else if (snapshort.hasError) {
            return Text("Erro!", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,

            ),);
          }

          return _buildCircularProgressIndicator();
        },
      ),
    );
  }

  ListView _buildListViewTelefones(List<CategoriaTelefones> categoria) {
    return ListView.builder(
      itemCount: categoria.length,
      itemBuilder: (BuildContext context, int i) {
        return _listTileTelefones(categoria, i);
      },
    );
  }

  ListTile _listTileTelefones(List<CategoriaTelefones> categorias, int i) {
    return ListTile(
      title: Text(categorias[i].categoria),
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => DetalheCategoriaTelefones(
              categoria: categorias[i],
            ),
          ),
        );
      },
    );
  }

  Container _buildCircularProgressIndicator() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(),
          ),
          Divider(
            color: Colors.transparent,
            height: 40,
          ),
          Text(
            'Carregando',
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final estiloTexto = new TextStyle( fontSize: 26 );
  final conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de clicks: ', style: estiloTexto ),
            Text( '$conteo', style: estiloTexto),
          ],
        )
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {

          print('Hola Mundo!!!');
          // conteo = conteo + 1;

        },
      ),
    );
  }

}
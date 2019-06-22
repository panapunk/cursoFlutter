import 'package:flutter/material.dart';


class ContadorPage extends StatefulWidget {

  @override
  createState() => _ContadorPageState();

}

class _ContadorPageState extends State<ContadorPage> {

  final _estiloTexto = new TextStyle( fontSize: 26 );
  int _conteo = 10;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateFul'),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de tabs: ', style: _estiloTexto ),
            Text( '$_conteo', style: _estiloTexto),
          ],
        )
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {
          
          setState( (){
            // print('Hola Mundo!!!');
            _conteo++;
          });

        },
      ),
    );
  }

}
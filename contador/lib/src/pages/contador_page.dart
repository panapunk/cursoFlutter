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
      floatingActionButton: _crearBotones(),
      
      // FloatingActionButton(
      //   child: Icon( Icons.add ),
      //   onPressed: () {          
      //     setState( (){
      //       // print('Hola Mundo!!!');
      //       _conteo++;
      //     });
      //   },
      // ),

    );
  }

  Widget _crearBotones() {

    return Row(

      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox( width: 30.0 ),
        FloatingActionButton( child: Icon( Icons.exposure_zero ), onPressed: _reset, ),
        Expanded( child: SizedBox() ),        
        FloatingActionButton( child: Icon( Icons.remove ), onPressed: _sustraer, ),
        SizedBox( width: 5.0 ), 
        FloatingActionButton( child: Icon( Icons.add ), onPressed: _agregar, ),
      ],
    );

  }

  void _agregar() {
    setState( () => _conteo++ );
  }
  void _sustraer() {
    setState( () => _conteo-- );
  }
  void _reset() {
    setState( () => _conteo = 0 );
  }



  

}
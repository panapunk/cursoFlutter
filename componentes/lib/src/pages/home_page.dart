import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text( 'Components' ),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    // print( menuProvider.opciones );
    // menuProvider.cargarData().then( (opciones){
    //   print( 'lista' );
    //   print( opciones );
    // });

    return FutureBuilder( 
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {

        // print( 'Builder' );
        // print( snapshot.data );

        print('cargado');

        return ListView(
          children: _listaItems( snapshot.data, context ),
        );

      },
    );

  }

  List<Widget>_listaItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> opciones = [];

    // if ( data == null ) {
    //   return [];
    // }

    data.forEach( (opt) {

      final widgetTemp = ListTile( 
        title: Text( opt['texto'] ),
        leading: getIcon( opt['icon'] ),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: ( ) {

          Navigator.pushNamed(context, opt['ruta'] );
          // Navigator.of(context).pushNamed(opt['ruta']);

          // final route = MaterialPageRoute(
          //   builder: ( context ) => AlertPage()
          // );

          // Navigator.push(context, route);

        },
    ); 

    opciones..add( widgetTemp )
            ..add( Divider() );

    });

    return opciones;

    // return [
    //   ListTile( title: Text('Hola Mundo !!!.'),),
    //   ListTile( title: Text('Hola Mundo !!!.'),),
    //   ListTile( title: Text('Hola Mundo !!!.'),),
    //   ListTile( title: Text('Hola Mundo !!!.'),),
    // ];

  }
}
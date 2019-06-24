import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'cuatro', 'Cinco', 'Seis', 'Siete', 'Ocho', 'Nueve', 'Diez'];  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemscorts()
        
        // <Widget>[
        //   ListTile(
        //     title: Text('ListTile Title'),
        //   ),
        //   Divider(),
        //   ListTile(
        //     title: Text('ListTile Title'),
        //   ),
        //   Divider(),
        //   ListTile(
        //     title: Text('ListTile Title'),
        //   ),
        //   Divider(),
        // ],

      ),
    );
  }

  List<Widget> _crearItems() {

    List<Widget> lista = new List<Widget>();

    for ( var opt in opciones ) {

      final tempWidget = ListTile( 
        title: Text( opt ),
      );

      lista..add( tempWidget )
           ..add( Divider() );

      // lista.add( tempWidget );
      // lista.add( Divider() );

    }

    return lista;
  }

  List<Widget> _crearItemscorts() {

    return opciones.map( ( item ) {
      return Column(
        children: <Widget>[
          ListTile( 
            title: Text( item + ' !' ),
            subtitle: Text('cualquier cosa'),
            leading: Icon( Icons.account_balance_wallet),
            trailing: Icon( Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();

  }

}

import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar( 
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),        
      ),
      floatingActionButton: FloatingActionButton( 
        child: Icon( Icons.add_location),
        onPressed: () {
          Navigator.pop( context );
        },
      ),
    );
    
  }

  void _mostrarAlerta(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {

        return AlertDialog(
          shape: RoundedRectangleBorder( 
            borderRadius: BorderRadius.circular(20.0)
          ),
          title: Text('titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.clear),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );

      },

    );


  }

}
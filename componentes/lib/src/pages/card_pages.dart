

import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text('Cards'),
      ),
      body: ListView(
        // padding: EdgeInsets.symmetric( horizontal: 25.0, vertical: 10.0 ) ,
        padding: EdgeInsets.all( 10.0 ) ,
        children: <Widget>[
          _cardTipo1(),
          SizedBox( height: 30.0 ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox( height: 30.0 ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox( height: 30.0 ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox( height: 30.0 ),
          _cardTipo2(),
        ],
      ),
    
    );
  }
          
  _cardTipo1() {

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.circular( 15.0 ),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue ),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text('Aquí estamos con la descripción de la tarjeta que queremos ver para tener una idea de la que queremos ver'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                },
              ),
            ],
          ),
        ],

      )
    );

  }

  _cardTipo2() {

    final card = Container(
      // clipBehavior: Clip.antiAlias,

      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://static.photocdn.pt/images/articles/2017/04/28/iStock-545347988.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://static.photocdn.pt/images/articles/2017/04/28/iStock-545347988.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner'),
          ),
      ],)
      // borderOnForeground: ,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset( 2.0, -10.0),
          ),
        ],
        // color: Colors.red,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      )
    );

  }

}
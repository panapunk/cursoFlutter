
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';



class InputPage extends StatefulWidget {

  @override 
  _InputPageState createState() => _InputPageState();

}


class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _pass = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['volar', 'Rayos X', 'Super Aliento', 'Super fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0),
        children: <Widget>[

          // Nombre
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),   
          _crearDropdown( ),
          Divider(),     
          // Salida Nombre
          _crearPersona(),
          Divider(),

        ],
      ),
    );
  }

  Widget _crearInput() {

bool nomostrar = true;
    // Ocultar teclado
    // sleep( 
    //   Duration(milliseconds: 500),
    // );
    // SystemChannels.textInput.invokeMethod('TextInput.hide');

    return TextField(
      // focusNode: FocusNode(),
      // onTap: () {
      //   SystemChannels.textInput.invokeMethod('TextInput.hide');
      //   // SystemChannels.textInput.invokeMethod('TextInput.hide');
      // },
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ) ,
        counter: Text('Letras ${ _nombre.length }' ),

        hintText: nomostrar ? 'Nombre de la persona, (placeholder)' : 'eeee',

        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon( Icons.accessibility),
        icon: InkWell(
          onTap: () {
            print('onTap');
            // FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Icon( Icons.account_circle )
        ),
      ),
      onChanged: (valorObtenido) {
        setState(() {
          _nombre = valorObtenido;
          print(_nombre);
        });
      },
    );

  }

  Widget _crearEmail() {

    // Ocultar teclado
    // sleep( 
    //   Duration(milliseconds: 500),
    // );
    // SystemChannels.textInput.invokeMethod('TextInput.hide');

    return TextField(
      keyboardType: TextInputType.emailAddress,
      // focusNode: FocusNode(),
      // onTap: () {
      //   SystemChannels.textInput.invokeMethod('TextInput.hide');
      //   // SystemChannels.textInput.invokeMethod('TextInput.hide');
      // },
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ) ,
        // counter: Text('Letras ${ _nombre.length }' ),
        hintText: 'Email, (placeholder)',
        labelText: 'Email',
        helperText: 'Solo es el email',
        suffixIcon: Icon( Icons.alternate_email),
        icon: InkWell(
          onTap: () {
            print('onTap');
            // FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Icon( Icons.email )
        ),
      ),
      onChanged: (valorObtenido) {
        setState(() {
          _email = valorObtenido;
          print(_email);
        });
      },
    );

  }

  Widget _crearPassword() {

    // Ocultar teclado
    // sleep( 
    //   Duration(milliseconds: 500),
    // );
    // SystemChannels.textInput.invokeMethod('TextInput.hide');

    return TextField(
      obscureText: true,
      // keyboardType: TextInputType.emailAddress,
      // focusNode: FocusNode(),
      // onTap: () {
      //   SystemChannels.textInput.invokeMethod('TextInput.hide');
      //   // SystemChannels.textInput.invokeMethod('TextInput.hide');
      // },
      // autofocus: true,
      // textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ) ,
        // counter: Text('Letras ${ _nombre.length }' ),
        hintText: 'passWord, (placeholder)',
        labelText: 'PassWord',
        helperText: 'Introduce tu contraseña',
        suffixIcon: Icon( Icons.extension),
        icon: InkWell(
          onTap: () {
            print('onTap');
            // FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Icon( Icons.extension )
        ),
      ),
      onChanged: (valorObtenido) {
        setState(() {
          _pass = valorObtenido;
          print(_pass);
        });
      },
    );

  }

  Widget _crearFecha( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ) ,
        // counter: Text('Letras ${ _nombre.length }' ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        // helperText: 'Fecha de nacimiento',
        suffixIcon: Icon( Icons.perm_contact_calendar),
        icon: Icon( Icons.calendar_today ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = List();

    _poderes.forEach( (poder) {

      lista.add( DropdownMenuItem(
        child: Text(poder),
        value: poder != null ? poder : '',
      ));

    });

    return lista;

  }



  Widget _crearDropdown( ) {



    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: ( opt ) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );

  }

  _selectDate( BuildContext context ) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: Locale( 'es', 'ES' ),
    );

    if ( picked != null ) {
      setState( () {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }





  Widget _crearPersona() {

    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Nombre es: $_nombre'),
        ),
        ListTile(
          title: Text('Email es: $_email'),
        ),
        ListTile(
          title: Text('Password es: $_pass'),
        ),
      ],
    );

  }

}

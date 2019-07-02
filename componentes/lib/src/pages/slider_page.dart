
import 'package:flutter/material.dart';




class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwich(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: ( _bloquearCheck ) ? null: ( valor ) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearCheckBox() {

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: ( valor ) {
    //     setState(() {
    //       _bloquearCheck = valor;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: ( valor ) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://i2.wp.com/batman-news.com/wp-content/uploads/2019/06/Medicom-MAFEX-Batman-Hush-16-9-featured.jpg?resize=696%2C391&quality=80&strip=info&ssl=1'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }

  Widget _crearSwich() {

    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: ( valor ) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

  }

}
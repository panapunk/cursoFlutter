

import 'dart:async' as prefix0;

/**
 * 
 */

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apikey = 'XXXXXXXXXXXXXXX';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  String _apiNumber = '3';

  int _popularesPage = 0;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;
  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    // final url = Uri.https(_url, url, {
    //   'api_key': _apikey,
    //   'language': _language}
    //   );
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    String _unencodedPath = _apiNumber + '/movie/now_playing';
    final url = Uri.https(
        _url, _unencodedPath, {'api_key': _apikey, 'language': _language});

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    _popularesPage++;

    String _unencodedPath = _apiNumber + '/movie/popular';
    final url = Uri.https(_url, _unencodedPath, {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);
    
    _populares.addAll(resp);
    popularesSink(_populares);

    return resp;

  }
}

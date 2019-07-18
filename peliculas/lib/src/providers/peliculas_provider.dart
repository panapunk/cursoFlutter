/**
 * 
 */

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apikey = '62b8db3ff0a4815d7a25f0589f5944c2';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  String _apiNumber = '3';

  Future<List<Pelicula>> _procesarRespuesta( Uri url ) async {
    
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

    String _unencodedPath = _apiNumber + '/movie/popular';
    final url = Uri.https(
        _url, _unencodedPath, {'api_key': _apikey, 'language': _language});

    return await _procesarRespuesta(url);
  }



}

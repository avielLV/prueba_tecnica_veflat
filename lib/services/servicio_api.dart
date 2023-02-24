import 'package:flutter/material.dart';
import 'package:prueba_tecnica_veflat/model/rick_morty_api.dart';
import 'package:http/http.dart' as http;

class ProductService with ChangeNotifier {
  List<Result> personajes = [];
  List<Result> shopping = [];

  ProductService() {
    getPersonaje();
  }
  getPersonaje() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/character');
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      final decodeData = RickMortyApi.fromJson(resp.body);
      personajes = decodeData.results;
      print(personajes);
      notifyListeners();
    }
  }

  agregarAShopping(Result personaje) {
    if (shopping.contains(personaje)) return;
    shopping.add(personaje);
  }
}

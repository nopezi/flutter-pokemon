import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_learn/model/PokemonDetail.dart';
import 'package:pokemon_learn/model/PokemonIndex.dart';

class PokemonAPI {
  Future<PokemonIndex> fetchPokemon(int offset) async {
    final res = await http.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?offset=${offset.toString()}&limit=20'));

    if (res.statusCode == 200) {
      return PokemonIndex.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to load pokemon');
    }
  }

  Future<PokemonDetail> fetchPokemonDetail(url) async {
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      return PokemonDetail.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to load pokemon');
    }
  }
}

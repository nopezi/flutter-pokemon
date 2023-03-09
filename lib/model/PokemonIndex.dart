import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class PokemonIndex {
  late List<PokemonSummary> pokemonSummary;

  PokemonIndex({required this.pokemonSummary});

  PokemonIndex.fromJson(Map<String, dynamic> json) {
    pokemonSummary = <PokemonSummary>[];

    if (json['results'] != null) {
      for (var i = 0; i < json['results'].length; i++) {
        pokemonSummary.add(PokemonSummary.fromJson(json['results'][i]));
        // pokemonSummary.add(json['results'][i]);
      }

      // json['results'].forEach((key, value) async {
      //   pokemonSummary.add(PokemonSummary.fromJson(value));
      // });
    }
  }
}

class PokemonSummary {
  String name = "";
  String url = "";

  PokemonSummary({required this.name, required this.url});

  PokemonSummary.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

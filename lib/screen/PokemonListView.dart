import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_learn/api/PokemonAPI.dart';
import 'package:pokemon_learn/model/PokemonIndex.dart';
import 'PokemonDetailScreen.dart';

class PokemonListView extends StatefulWidget {
  final pokemonList;

  const PokemonListView({required Key? key, required this.pokemonList})
      : super(key: key);

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  int currentOffset = 0;
  late List<PokemonSummary> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = widget.pokemonList;
  }

  checkPokemon(context, url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PokemonDetailScreen(url: url)));
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      child: ListView.builder(
          itemCount: _pokemonList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 50,
              child: ListTile(
                // ignore: unnecessary_string_interpolations
                title: Text('${_pokemonList[index].name}'),
                onTap: () {
                  checkPokemon(context, _pokemonList[index].url);
                },
              ),
            );
          }),
      onNotification: (notification) {
        currentOffset = currentOffset + 5;
        PokemonAPI().fetchPokemon(currentOffset).then((res) => {
              setState(() {
                _pokemonList.addAll((res.pokemonSummary));
              })
            });
        return true;
      },
    );
  }
}

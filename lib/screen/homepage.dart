import 'package:flutter/material.dart';
import 'package:pokemon_learn/api/PokemonApi.dart';
import 'package:pokemon_learn/model/PokemonIndex.dart';
import 'package:pokemon_learn/screen/PokemonListView.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  // final String title;
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Future<PokemonIndex> pokemonIndex;

  @override
  void initState() {
    super.initState();
    pokemonIndex = PokemonAPI().fetchPokemon(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Index'),
      ),
      body: FutureBuilder(
        future: pokemonIndex,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            var pokemonList = snapshot.data?.pokemonSummary;
            return PokemonListView(
              pokemonList: pokemonList, key: null,
            );
          }
          // loading state
          // return const CircularProgressIndicator();
        },
      ),
    );
  }
}

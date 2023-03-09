import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokemon_learn/api/PokemonAPI.dart';
import 'package:pokemon_learn/model/PokemonDetail.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String url;

  const PokemonDetailScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  late Future<PokemonDetail> pokemon;

  @override
  void initState() {
    super.initState();
    pokemon = PokemonAPI().fetchPokemonDetail(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: pokemon,
        builder: (context, snapshot) {
          print(snapshot);
          if (!snapshot.hasData) {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else {
            final pokemon = snapshot.data;
            return Scaffold(
                appBar: AppBar(
                  title: Text('Detail Pokemon ${pokemon?.name}'),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(children: [
                      Center(
                        child: Text(
                          '${pokemon?.name.toLowerCase()}',
                          style:
                              TextStyle(fontSize: 50, color: Colors.blue[400]),
                        ),
                      ),
                      Image.network(
                        '${pokemon?.sprites.front}',
                        scale: 0.5,
                      ),
                      Image.network(
                        '${pokemon?.sprites.back}',
                        scale: 0.5,
                      ),
                      Image.network(
                        '${pokemon?.sprites.frontShiny}',
                        scale: 0.5,
                      ),
                      Image.network(
                        '${pokemon?.sprites.backShiny}',
                        scale: 0.5,
                      ),
                      Text('${pokemon?.name}'),
                      Text(
                        'Data H : ${pokemon?.height} W: ${pokemon?.weight}',
                        style: TextStyle(fontSize: 20, color: Colors.blue[400]),
                      ),
                    ]),
                  ),
                ));
          }
        });
  }
}

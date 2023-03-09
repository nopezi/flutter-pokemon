class PokemonDetail {
  late String name;
  late int weight;
  late int height;
  late PokemonSprites sprites;

  PokemonDetail(
      {required this.name,
      required this.weight,
      required this.height,
      required this.sprites});

  PokemonDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    weight = json['weight'];
    height = json['height'];
    sprites = PokemonSprites.fromJson(json['sprites']);
  }
}

class PokemonSprites {
  late String front;
  late String back;
  late String frontShiny;
  late String backShiny;

  PokemonSprites({required this.front, required this.back});

  PokemonSprites.fromJson(dynamic json) {
    front = json['front_default'];
    back = json['back_default'];
    frontShiny = json['front_shiny'];
    backShiny = json['back_shiny'];
  }
}

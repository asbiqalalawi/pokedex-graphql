import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel {
  final String id;
  final String name;
  final String number;
  final String image;
  final Map<String, String> weight;
  final Map<String, String> height;
  final List<String> types;
  final List<String> resistant;
  final List<String> weaknesses;

  PokemonModel({
    required this.id,
    required this.name,
    required this.number,
    required this.image,
    required this.weight,
    required this.height,
    required this.types,
    required this.resistant,
    required this.weaknesses,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}

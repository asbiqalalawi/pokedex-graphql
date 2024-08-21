import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_entity.g.dart';

@JsonSerializable()
class PokemonEntity extends Equatable {
  final String id;
  final String name;
  final String number;
  final String image;
  final Map<String, String> weight;
  final Map<String, String> height;
  final List<String> types;
  final List<String> resistant;
  final List<String> weaknesses;

  const PokemonEntity({
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

  factory PokemonEntity.fromJson(Map<String, dynamic> json) => _$PokemonEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonEntityToJson(this);

  @override
  List<Object> get props => [id, name, image, types];
}
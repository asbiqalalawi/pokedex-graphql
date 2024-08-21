// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      id: json['id'] as String,
      name: json['name'] as String,
      number: json['number'] as String,
      image: json['image'] as String,
      weight: Map<String, String>.from(json['weight'] as Map),
      height: Map<String, String>.from(json['height'] as Map),
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      resistant:
          (json['resistant'] as List<dynamic>).map((e) => e as String).toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'image': instance.image,
      'weight': instance.weight,
      'height': instance.height,
      'types': instance.types,
      'resistant': instance.resistant,
      'weaknesses': instance.weaknesses,
    };

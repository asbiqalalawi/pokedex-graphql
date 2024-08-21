import 'package:flutter/material.dart';

class Identity {
  static const primary = Color(0XFFDC0A2D);
}

class PokemonType {
  static const bug = Color(0XFFA7B723);
  static const dark = Color(0XFF75574C);
  static const dragon = Color(0XFF7037FF);
  static const electric = Color(0XFFF9CF30);
  static const fairy = Color(0XFFE69EAC);
  static const fighting = Color(0XFFC12239);
  static const fire = Color(0XFFF57D31);
  static const flying = Color(0XFFA891EC);
  static const ghost = Color(0XFF70559B);
  static const normal = Color(0XFFAAA67F);
  static const grass = Color(0XFF74CB48);
  static const ground = Color(0XFFDEC16B);
  static const ice = Color(0XFF9AD6DF);
  static const poison = Color(0XFFA43E9E);
  static const psychic = Color(0XFFFB5584);
  static const rock = Color(0XFFB69E31);
  static const steel = Color(0XFFB7B9D0);
  static const water = Color(0XFF6493EB);

  static Color getColor(String type) {
    switch (type) {
      case 'bug':
        return PokemonType.bug;
      case 'dark':
        return PokemonType.dark;
      case 'dragon':
        return PokemonType.dragon;
      case 'electric':
        return PokemonType.electric;
      case 'fairy':
        return PokemonType.fairy;
      case 'fighting':
        return PokemonType.fighting;
      case 'fire':
        return PokemonType.fire;
      case 'flying':
        return PokemonType.flying;
      case 'ghost':
        return PokemonType.ghost;
      case 'normal':
        return PokemonType.normal;
      case 'grass':
        return PokemonType.grass;
      case 'ground':
        return PokemonType.ground;
      case 'ice':
        return PokemonType.ice;
      case 'poison':
        return PokemonType.poison;
      case 'psychic':
        return PokemonType.psychic;
      case 'rock':
        return PokemonType.rock;
      case 'steel':
        return PokemonType.steel;
      case 'water':
        return PokemonType.water;
      default:
        return Colors.black;
    }
  }
}

class GrayScale {
  static const dark = Color(0XFF1D1D1D);
  static const medium = Color(0XFF666666);
  static const light = Color(0XFFE0E0E0);
  static const background = Color(0XFFEFEFEF);
  static const white = Color(0XFFFFFFFF);
}
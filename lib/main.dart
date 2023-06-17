import 'package:flutter/material.dart';
import 'package:pokedex_app/dependencies.dart';
import 'package:pokedex_app/features/pokemon/presentation/pokedex_screen.dart';

void main() {
  setup();
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pokedex',
      home: PokedexScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/pokemon_cubit.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/viewPokemonListWidget/pokemon_button_widget.dart';
import '../../../domain/entities/pokemon_entity.dart';

class PokemonScrollWidget extends StatefulWidget {
  final List<PokemonEntity> pokemonList;
  const PokemonScrollWidget({super.key, required this.pokemonList});

  @override
  State<PokemonScrollWidget> createState() => _PokemonScrollWidgetState();
}

class _PokemonScrollWidgetState extends State<PokemonScrollWidget> {
  int selectedIndex = 0;
  int offset = 20;
  int limit = 20;
  late List<PokemonEntity> pokemonList;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<PokemonCubit>().updatePokemonList(offset, limit);
        offset = offset + limit;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 55.0, right: 50.0),
      //Create the grid with my pokemons
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.85,
          crossAxisCount: 2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: widget.pokemonList.length, //Two rows
        itemBuilder: (BuildContext context, int index) {
          final buttonIndex = index ~/ 2 * 2 + (index % 2);
          if (buttonIndex >= widget.pokemonList.length) {
            //To fill the empty spaces if there are not enought elements
            return const SizedBox();
          }
          //If the index is the last one, show the loading indicator
          if (buttonIndex == widget.pokemonList.length - 1) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          final pokemon = widget.pokemonList[buttonIndex];
          final isSelected = buttonIndex == selectedIndex;
          return PokemonButtonWidget(
            imageUrl: pokemon.sprites!.other!.officialArtwork!.frontDefault!,
            isSelected: isSelected,
            onTap: () {
              setState(() {
                selectedIndex = buttonIndex;
              });
              context.read<PokemonCubit>().updateSelectedPokemon(selectedIndex);
            },
          );
        },
      ),
    );
  }
}

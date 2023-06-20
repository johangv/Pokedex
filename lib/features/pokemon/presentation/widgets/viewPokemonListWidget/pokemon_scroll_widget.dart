import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/pokemon_state.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/viewPokemonListWidget/pokemon_button_widget.dart';
import '../../../domain/entities/pokemon_entity.dart';
import '../../cubit/lazy_pokemon_load_cubit.dart';
import '../../cubit/pokemon_status.dart';

class PokemonScrollWidget extends StatefulWidget {
  final List<PokemonEntity> pokemonList;
  final Function(int selectedIndex) setSelectedIndex;
  const PokemonScrollWidget(
      {super.key, required this.pokemonList, required this.setSelectedIndex});

  @override
  State<PokemonScrollWidget> createState() => _PokemonScrollWidgetState();
}

class _PokemonScrollWidgetState extends State<PokemonScrollWidget> {
  int selectedIndex = 0;
  int offset = 20;
  int limit = 20;
  bool _loadingMore = false;
  late List<PokemonEntity> pokemonList;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<LazyPokemonCubit>().updatePokemonList(offset, limit);
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
    return BlocListener<LazyPokemonCubit, PokemonState>(
      listener: (context, state) {
        if (state.status == PokemonStatus.success) {
          //If Charging success, add the new pokemons to the list
          setState(() {
            widget.pokemonList.addAll(state.pokemonList);
            offset = offset + 20;
            _loadingMore = false;
          });
        } else if (state.status == PokemonStatus.error) {
          //If Charging error, show the error message
          setState(() {
            _loadingMore = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  "Ups! Sorry, an error ocurred while loading more pokemon"),
            ),
          );
        } else {
          setState(() {
            _loadingMore = true;
          });
        }
      },
      child: Container(
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
          itemCount:
              widget.pokemonList.length + (_loadingMore ? 1 : 0), //Two rows
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
                widget.setSelectedIndex(selectedIndex);
              },
            );
          },
        ),
      ),
    );
  }
}

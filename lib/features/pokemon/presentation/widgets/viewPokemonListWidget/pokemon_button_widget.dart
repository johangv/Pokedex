import 'package:flutter/material.dart';
import 'package:pokedex_app/features/utils/app_colors.dart';

class PokemonButtonWidget extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;
  final bool isSelected;
  const PokemonButtonWidget(
      {super.key,
      required this.imageUrl,
      required this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20.0,
        height: 20.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.red : appColors.lightGray,
        ),
        child: Image(
          image: NetworkImage(imageUrl),
          width: 80.0,
        ),
      ),
    );
  }
}

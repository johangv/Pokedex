import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class PokemonStatItemWidget extends StatelessWidget {
  final String stat;
  final String value;
  const PokemonStatItemWidget(
      {super.key, required this.stat, required this.value});

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors();

    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              stat,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: appColors.darkGray,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: appColors.darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

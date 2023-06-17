import 'package:flutter/material.dart';

class PokemonStatItemWidget extends StatelessWidget {
  final String stat;
  final String value;
  const PokemonStatItemWidget(
      {super.key, required this.stat, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              stat,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xff262626),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xff262626),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PokemonImageLoader extends StatelessWidget {
  final String url;

  const PokemonImageLoader({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: precacheImage(NetworkImage(url), context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: const EdgeInsets.only(top: 90.0),
            child: const CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (snapshot.hasError) {
          return const Image(
            image: AssetImage(
              "assets/images/types/no_icon.png",
            ),
            width: 250.0,
          );
        } else {
          return Image(
            image: NetworkImage(
              url,
            ),
            width: 250.0,
          );
        }
      },
    );
  }
}

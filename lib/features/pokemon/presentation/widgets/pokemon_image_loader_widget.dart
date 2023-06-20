import 'package:flutter/material.dart';

class PokemonImageLoader extends StatelessWidget {
  final String url;
  final double? width;
  final EdgeInsetsGeometry? margin;
  const PokemonImageLoader(
      {super.key, required this.url, this.width, this.margin});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: precacheImage(NetworkImage(url), context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              margin: margin,
              child: const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Image(
            image: const AssetImage(
              "assets/images/types/no_icon.png",
            ),
            width: width,
          );
        } else {
          return Image(
            image: NetworkImage(
              url,
            ),
            width: width,
          );
        }
      },
    );
  }
}

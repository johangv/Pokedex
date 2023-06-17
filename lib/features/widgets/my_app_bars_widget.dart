import 'package:flutter/material.dart';

class MyAppBars {
  static getPokedexAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.red,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/pokeball.png'),
            width: 40.0,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(title),
        ],
      ),
    );
  }
}

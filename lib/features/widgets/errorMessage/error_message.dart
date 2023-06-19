import 'package:flutter/material.dart';
import 'package:pokedex_app/features/widgets/errorMessage/reload_button.dart';

import '../../utils/app_colors.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;
  final ReloadButton? reloadButton;
  const ErrorMessage(
      {super.key, required this.errorMessage, this.reloadButton});

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors();

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/pikachu_thinking.png"),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                "Ups! Something went wrong getting the pokemon information:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: appColors.darkGray,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: appColors.darkGray,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            if (reloadButton != null) reloadButton!,
          ],
        ),
      ),
    );
  }
}

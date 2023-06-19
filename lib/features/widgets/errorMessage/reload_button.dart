import 'package:flutter/material.dart';

class ReloadButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ReloadButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

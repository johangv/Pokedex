import 'package:flutter/material.dart';
import 'package:pokedex_app/features/utils/app_colors.dart';

class ChargingAnimation extends StatefulWidget {
  const ChargingAnimation({super.key});

  @override
  State<ChargingAnimation> createState() => _ChargingAnimationState();
}

class _ChargingAnimationState extends State<ChargingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final AppColors appColors = AppColors();

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animation.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _animation,
              child: Image.asset(
                'assets/images/pokeball.png',
                width: 100.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 20.0,
                color: appColors.darkGray,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

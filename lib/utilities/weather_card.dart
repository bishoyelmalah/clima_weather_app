import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({super.key, required this.bgColor, this.cardChild, this.onPress});

  final Color bgColor;
  final Widget? cardChild;
  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}

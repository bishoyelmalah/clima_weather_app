import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../utilities/weather_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlue[400],
      backgroundColor: Color(0xFF1D1E33),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '26°C',
                      style: TextStyle(
                        fontSize: 100,
                      ),
                    ),
                    Icon(
                      Icons.sunny,
                      color: Colors.yellow,
                      size: 70,
                    )
                  ],
                ),
              ),
            ),
            WeatherCard(
              bgColor: kCardColor,
              cardChild: Container(
                height: 350,
              ),
            )
          ],
        ),
      ),
    );
  }
}

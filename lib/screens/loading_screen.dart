import 'package:clima_weather_app/screens/location_screen.dart';
import 'package:flutter/material.dart';
import '../services/networking.dart';
import '../services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var weatherData;

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    Location geoLocation = Location();
    await geoLocation.getLocationData();

    Networking data = Networking(
        latitude: geoLocation.latitude, longitude: geoLocation.longitude);

    weatherData = await data.getWeatherData();

    bool? shouldReloud =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
      // return MainScreen();
    }));

    if (shouldReloud == true) {
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

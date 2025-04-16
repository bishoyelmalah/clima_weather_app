import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utilities/constants.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.locationWeather});

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String cityName;
  late String region;
  late String country;
  late double tempreture;
  late String condition;
  late String iconLink;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    cityName = weatherData["location"]["name"];
    region = weatherData["location"]["region"];
    country = weatherData["location"]["country"];
    tempreture = weatherData["current"]["temp_c"];
    condition = weatherData["current"]["condition"]["text"];
    iconLink = weatherData["current"]["condition"]["icon"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withValues(alpha: 0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        tempreture.toInt().toString(),
                        style: kTempTextStyle,
                      ),
                      Image(
                        image: NetworkImage("https:$iconLink"),
                        fit: BoxFit.contain,
                        height: 120,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          cityName,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          ", $region",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  )
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  condition,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../utilities/constants.dart';

class Networking {
  Networking({required this.latitude, required this.longitude});

  double latitude;
  double longitude;

  Future getWeatherData() async {
    http.Response response = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=$kWeatherAPI&q=$latitude,$longitude"));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

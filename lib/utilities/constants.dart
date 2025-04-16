import 'package:flutter/material.dart';

const String kWeatherAPI = "9c21ead936534619bfe160844250904";

// const Color kCardColor = Color(0xFF1D1E33);
const Color kCardColor = Color(0x2AFFFFFF);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

var kTextInputStyleDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city),
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

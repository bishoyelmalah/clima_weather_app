import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.high,
  distanceFilter: 100,
);

class Location {
  late double latitude;
  late double longitude;

  Future<void> getLocationData() async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            locationSettings: locationSettings);
        latitude = position.latitude;
        longitude = position.longitude;
      } catch (e) {
        print('Error getting location: $e');
      }
    }
  }
}

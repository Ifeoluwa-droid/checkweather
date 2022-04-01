import 'package:flutter_app/Services/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'networking.dart';

class Location {

  double latitude;
  double longitude;

  Location({this.latitude, this.longitude});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

}

Future<String> getCurrentLocation() async {
  Location location = Location();
  await location.getCurrentLocation();
  NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

  var weatherData = await networkHelper.getData();

  return weatherData['name'];
}
import 'package:flutter_app/Services/Location.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter_app/Components/constants.dart';
import 'networking.dart';
import 'package:flutter_app/Services/Location.dart';


const apiKey = 'api_key'; 
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

/*
* This will be the brain for the weather. Each location entered will have its own weathermodel*/

  Future<dynamic> getCityWeather(String cityName) async {
    try {
      NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();

      return weatherData;
    } catch (SocketException) {
      print("Check your internet connection");
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();
    try {
      NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();

      return weatherData;
    } catch (SocketException) {
      print("Check your internet connection");
    }
  }
}

Map weatherImage = {
  'Clear': 'clear',
  'Clouds': 'cloud-day',
  'Thunderstorm':'stormy',
  'Drizzle':'drizzly',
  'Rain':'rain-day',
  'Snow':'snowy',
  "Mist":'misty',
  "Smoke":'smoky',
  'Haze':'hazy',
  'Dust':'dusty',
  'Fog':'foggy',
  'Sand':'sandy',
  'Ash':'ashy',
  'Squall':'squall',
  'Tornado':'tornado',
};

Map weatherIcon = {
  "Clouds": WeatherIcons.cloud,
  'Clear': WeatherIcons.night_clear,
  'Thunderstorm':WeatherIcons.thunderstorm,
  'Drizzle':WeatherIcons.raindrops,
  'Rain':WeatherIcons.rain,
  'Snow':WeatherIcons.snow,
  "Mist":WeatherIcons.fog,
  "Smoke":WeatherIcons.smoke,
  'Haze':WeatherIcons.day_haze,
  'Dust':WeatherIcons.dust,
  'Fog':WeatherIcons.fog,
  'Sand':WeatherIcons.sandstorm,
  'Ash':WeatherIcons.snow,
  'Squall':WeatherIcons.fog,
  'Tornado':WeatherIcons.tornado,
};

Map paramCardColor = {
  "Clouds": cloudyDayCardColor,
  "Clear": cloudyDayCardColor,
  'Thunderstorm': cloudyDayCardColor,
  'Drizzle':rainyDayCardColor,
  'Rain':rainyDayCardColor,
  'Snow':rainyDayCardColor,
  "Mist":rainyDayCardColor,
  "Smoke":rainyDayCardColor,
  'Haze':rainyDayCardColor,
  'Dust':cloudyDayCardColor,
  'Fog':cloudyDayCardColor,
  'Sand':sandyDayCardColor,
  'Ash':cloudyDayCardColor,
  'Squall':cloudyDayCardColor,
  'Tornado':rainyDayCardColor,
};

Map paramDropdownColor = {
  "Clouds": cloudyDayParamDropdownColor,
  "Clear": cloudyDayParamDropdownColor,
  'Thunderstorm':cloudyDayParamDropdownColor,
  'Drizzle':rainyDayParamDropdownColor,
  'Rain':rainyDayParamDropdownColor,
  'Snow':rainyDayParamDropdownColor,
  "Mist":rainyDayParamDropdownColor,
  "Smoke":rainyDayParamDropdownColor,
  'Haze':rainyDayParamDropdownColor,
  'Dust':cloudyDayParamDropdownColor,
  'Fog':cloudyDayParamDropdownColor,
  'Sand':sandyDayParamDropdownColor,
  'Ash':cloudyDayParamDropdownColor,
  'Squall':cloudyDayParamDropdownColor,
  'Tornado':rainyDayParamDropdownColor,
};

Map paramDropdownIconColor = {
  'Clouds': cloudyDayParamDropdownIconColor,
  "Clear":cloudyDayParamDropdownIconColor,
  'Thunderstorm':cloudyDayParamDropdownIconColor,
  'Drizzle':rainyDayParamDropdownIconColor,
  'Rain':rainyDayParamDropdownIconColor,
  'Snow':rainyDayParamDropdownIconColor,
  "Mist":rainyDayParamDropdownIconColor,
  "Smoke":rainyDayParamDropdownIconColor,
  'Haze':rainyDayParamDropdownIconColor,
  'Dust':cloudyDayParamDropdownIconColor,
  'Fog':cloudyDayParamDropdownIconColor,
  'Sand':sandyDayParamDropdownIconColor,
  'Ash':cloudyDayParamDropdownIconColor,
  'Squall':cloudyDayParamDropdownIconColor,
  'Tornado':rainyDayParamDropdownIconColor,
};

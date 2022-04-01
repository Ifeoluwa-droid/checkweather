import 'package:flutter/material.dart';
import 'package:flutter_app/Components/cloudy_day.dart';
import 'package:flutter_app/Components/constants.dart';
import 'package:flutter_app/screens/get_weather.dart';
import 'package:flutter_app/Screens/loading_screen.dart';
import 'Screens/weather_condition.dart';
import 'package:weather_icons/weather_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}



/*
* Cloudy Day
* weatherImage => 'cloud-day'
* weatherIcon => WeatherIcons.day_cloudy
* weatherCondition => 'Cloudy'
* temperature
* paramCardColor => Colors.blue[200].withOpacity(0.4),
* paramDropdownColor => Colors.blueGrey
* paramDropdownIconColor => Colors.blue[500]
* */

/*
* Rainy Day
* weatherImage => 'rainy-day'
* weatherIcon => WeatherIcons.day_rain
* weatherCondition => 'Rainy'
* temperature =>
* paramCardColor => Colors.green[50].withOpacity(0.4),
* paramDropdownColor => Colors.green[500]
* paramDropdownIconColor => Colors.green[500]
* */

/*
* Rainy Night
* weatherImage => 'rain-night'
* weatherIcon => WeatherIcons.night_rain
* weatherCondition => 'Rainy'
* temperature
* paramCardColor => Colors.blueGrey.withOpacity(0.4),
* paramDropdownColor => Colors.blueGrey
* paramDropdownIconColor => None
* */

/*
* Sunny Day
* weatherImage => 'sun-day'
* weatherIcon => WeatherIcons.day_sunny
* weatherCondition => 'Sunny'
* temperature
* paramCardColor => Colors.orange[100].withOpacity(0.4),
* paramDropdownColor => Colors.orange[500],
* paramDropdownIconColor => Colors.orange[500]
* */


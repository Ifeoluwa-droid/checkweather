import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/get_weather.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:weather_icons/weather_icons.dart';
import '../Services/weather.dart' as wt;
import '../Components/add-ons.dart';
import 'package:flutter_app/Components/dropdowns.dart';
import 'package:flutter_app/Components/time_manager.dart';
import 'package:flutter_app/Components/constants.dart';
import 'package:flutter_app/Services/conversion.dart';

class WeatherCondition extends StatefulWidget {
  final locationWeather;// dynamic

  WeatherCondition({this.locationWeather});

  @override
  _WeatherConditionState createState() => _WeatherConditionState();
}

class _WeatherConditionState extends State<WeatherCondition> {
  wt.WeatherModel weather = wt.WeatherModel();
  String weatherDescription;
  int temperature;
  int tempInCelsius;
  var pressure;
  var pressureInPa;
  int humidity;
  var windSpeed;
  var windSpeedInmps;
  String temperatureUnit = "℃";
  String pressureUnit = "Pa";
  String windUnit = "m/s";
  String cityName;
  String weatherImage;
  IconData weatherIcon;
  Color paramCardColor;
  Color paramDropdownColor;
  Color paramDropdownIconColor;
  WeatherUnitsConverter converter;
  String currentTime = nowTime();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateUI(widget.locationWeather); /***************************/
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      temperatureUnit = "℃";
      pressureUnit = "Pa";
      windUnit = "m/s";
      temperature = weatherData['main']['temp'].toInt();
      tempInCelsius = temperature;
      pressure = weatherData['main']['pressure'];
      pressureInPa = pressure;
      humidity = weatherData['main']['humidity'].toInt();
      windSpeed = weatherData['wind']['speed'];
      windSpeedInmps = windSpeed;
      weatherDescription = weatherData['weather'][0]['description'];
      var weatherCondition = weatherData['weather'][0]['main'];
      cityName = weatherData['name'];
      weatherImage = wt.weatherImage[weatherCondition];
      weatherIcon = wt.weatherIcon[weatherCondition];
      paramCardColor = wt.paramCardColor[weatherCondition];
      paramDropdownColor = wt.paramDropdownColor[weatherCondition];
      paramDropdownIconColor = wt.paramDropdownIconColor[weatherCondition];
      converter = WeatherUnitsConverter(
          tempInCelsius: tempInCelsius,
          pressureInPa: pressureInPa,
          windSpeedInmps: windSpeedInmps);
      currentTime = nowTime();
    });
  }

  Future<bool> onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        backgroundColor: Colors.white,
        content: Text('Do you want to exit the app?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text('NO', style: TextStyle(color: Colors.blue, fontSize: 15,)),
              ),
              SizedBox(width: 50),
              GestureDetector(
                onTap: () => SystemNavigator.pop(), //exit(0),
                child: Text('YES', style: TextStyle(color: Colors.blue, fontSize: 15,)),
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/${weatherImage}.jpeg'),
            fit: BoxFit.cover,
          )),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.4, 0.6, 0.8, 1],
                colors: [
                  Colors.black.withOpacity(.1),
                  Colors.black.withOpacity(.2),
                  Colors.black.withOpacity(.3),
                  Colors.black.withOpacity(.4),
                  Colors.black.withOpacity(.5),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: SafeArea(
                child: ListView(scrollDirection: Axis.vertical, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () async {
                              var weatherData =
                                  await weather.getLocationWeather();
                              updateUI(weatherData);
                            },
                            icon: Icon(
                              Icons.location_on_sharp,
                              color: Colors.white,
                            ),
                            iconSize: 40.0,
                          ),
                          IconButton(
                            onPressed: () async {
                              var enteredName = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return GetWeatherScreen();
                              }));
                              if (enteredName != null) {
                                try {
                                  var weatherData =
                                  await weather.getCityWeather(enteredName);
                                  updateUI(weatherData);
                                } catch(NoSuchMethodError) {
                                  Alert(
                                    context: context,
                                    type: AlertType.warning,
                                    desc: "Location does not exist!",
                                    buttons: [
                                      DialogButton(child: Text("OK", style: TextStyle(color: Colors.blue, fontSize: 20,)), color: Colors.white, onPressed: () => Navigator.pop(context),)
                                    ],
                                  ).show();
                                }
                              }
                            },
                            icon: Icon(Icons.location_city, color: Colors.white),
                            hoverColor: Colors.black,
                            iconSize: 40.0,
                            visualDensity: VisualDensity.comfortable,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(cityName,
                          style:
                              TextStyle(color: kLocationColor, fontSize: 60)),
                      Container(
                        child:
                            BoxedIcon(weatherIcon, size: 50, color: Colors.white),
                      ),
                      Container(
                          child: Center(
                              child: Text(
                        weatherDescription,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2.0,
                          fontFamily: 'Inconsolata',
                          fontSize: 24,
                        ),
                      ))),
                      Container(
                          child: Text('$temperature$temperatureUnit',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 2.0,
                                fontSize: 60,
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TempParams(
                                    icon: BoxedIcon(WeatherIcons.barometer,
                                        color: Colors.white),
                                    tempParam: "Atm. pressure",
                                    paramValue: '$pressure',
                                    paramUnit: pressureUnit),
                                TempParams(
                                    icon: BoxedIcon(WeatherIcons.humidity,
                                        color: Colors.white),
                                    tempParam: "Humidity",
                                    paramValue: '$humidity',
                                    paramUnit: "%"),
                                TempParams(
                                    icon: BoxedIcon(WeatherIcons.wind,
                                        color: Colors.white),
                                    tempParam: "Wind",
                                    paramValue: windSpeed.toStringAsFixed(2),
                                    paramUnit: windUnit),
                                SizedBox(height: 20),
                                Text(
                                  "as at $currentTime local time",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inconsolata'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 50,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  elevation: 5,
                                  color: paramCardColor, //
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Center(
                                        child: Text(
                                          "Temperature",
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 2.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            DropdownButton(
                                                dropdownColor:
                                                    paramDropdownColor, //
                                                underline: Container(),
                                                value: tempDropDownValue,
                                                icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color:
                                                        paramDropdownIconColor), //
                                                items:
                                                    tempItems.map((String items) {
                                                  return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(items,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            letterSpacing: 1.0,
                                                            fontSize: 13,
                                                          )));
                                                }).toList(),
                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    tempDropDownValue = newValue;
                                                    temperatureUnit = newValue;
                                                    temperature = converter
                                                        .temperatureConverter(
                                                            newValue); //////////////////////////////////////////
                                                  });
                                                }),
                                            SizedBox(width: 20.0),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 50,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  elevation: 5,
                                  color: paramCardColor,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Center(
                                        child: Text(
                                          "Atm. pressure",
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 2.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            DropdownButton(
                                                underline: Container(),
                                                dropdownColor: paramDropdownColor,
                                                value: pressureDropDownValue,
                                                icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color:
                                                        paramDropdownIconColor),
                                                items: pressureItems
                                                    .map((String items) {
                                                  return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(items,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            letterSpacing: 1.0,
                                                            fontSize: 13,
                                                          )));
                                                }).toList(),
                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    pressureDropDownValue =
                                                        newValue;
                                                    pressureUnit = newValue;
                                                    pressure = newValue == "Pa"
                                                        ? converter
                                                            .pressureConverter(
                                                                newValue)
                                                            .toInt()
                                                        : converter
                                                            .pressureConverter(
                                                                newValue)
                                                            .toStringAsFixed(2);
                                                  });
                                                }),
                                            SizedBox(width: 20.0),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 50,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  elevation: 5,
                                  color: paramCardColor,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Center(
                                        child: Text(
                                          "Wind",
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 2.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            DropdownButton(
                                                underline: Container(),
                                                dropdownColor: paramDropdownColor,
                                                value: windDropDownValue,
                                                icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color:
                                                        paramDropdownIconColor),
                                                items:
                                                    windItems.map((String items) {
                                                  return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(items,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            letterSpacing: 1.0,
                                                            fontSize: 13,
                                                          )));
                                                }).toList(),
                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    windDropDownValue = newValue;
                                                    windUnit = newValue;
                                                    windSpeed = converter
                                                        .windConverter(newValue);
                                                  });
                                                }),
                                            SizedBox(width: 20.0),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

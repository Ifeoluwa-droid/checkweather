import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class TempParams extends StatelessWidget {
  BoxedIcon icon;
  String tempParam;
  String paramValue;
  String paramUnit;

  TempParams(
      {@required this.icon,
      @required this.tempParam,
      @required this.paramValue,
      @required this.paramUnit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        icon,
        SizedBox(
          width: 10,
        ),
        Text(tempParam,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                letterSpacing: 2.0,
                fontFamily: 'Inconsolata')),
        SizedBox(
          width: 10,
        ),
        Text(paramValue,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            )),
        Text(paramUnit,
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0))
      ],
    );
  }
}

class WeatherTemplate extends StatelessWidget {
  String weatherParam;
  DropdownButton dropdownButton;

  WeatherTemplate({this.weatherParam, this.dropdownButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 50,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            elevation: 5,
            color: Color(0xFFDAEAFF),
            shadowColor: Color(0xFF1A5DC6),
            child: Row(
              children: [
                SizedBox(width: 10),
                Center(
                  child: Text(
                    weatherParam,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(width: 80),
                dropdownButton
              ],
            )),
      ),
    );
    ;
  }
}

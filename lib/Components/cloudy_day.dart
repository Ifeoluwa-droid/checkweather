import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter_app/Components/add-ons.dart';
import 'dropdowns.dart';
import 'time_manager.dart';
import 'constants.dart';

class CloudyDay extends StatefulWidget {
  const CloudyDay({Key key}) : super(key: key);

  @override
  _CloudyDayState createState() => _CloudyDayState();
}

class _CloudyDayState extends State<CloudyDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/tornado.jpeg'),
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
            child: ListView(scrollDirection: Axis.vertical, children: [
              Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 243, 243, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Colors.blueGrey,
                          ),
                          hintText: "Enter location",
                          hintStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 15),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text("Akure",
                        style: TextStyle(color: kLocationColor, fontSize: 60)),
                  ),
                  Container(
                    child: BoxedIcon(WeatherIcons.day_cloudy,
                        size: 50, color: Colors.white),
                  ),
                  Container(
                      child: Center(
                          child: Text(
                    "Cloudy",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontSize: 20,
                    ),
                  ))),
                  Container(
                      child: Text("34℃",
                          style: TextStyle(
                            color: Colors.white,
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
                                paramValue: "1029",
                                paramUnit: "Pa"),
                            TempParams(
                                icon: BoxedIcon(WeatherIcons.humidity,
                                    color: Colors.white),
                                tempParam: "Humidity",
                                paramValue: "68",
                                paramUnit: "%"),
                            TempParams(
                                icon: BoxedIcon(WeatherIcons.wind,
                                    color: Colors.white),
                                tempParam: "Wind",
                                paramValue: "43",
                                paramUnit: "Km/hr"),
                            TempParams(
                                icon: BoxedIcon(WeatherIcons.cloud,
                                    color: Colors.white),
                                tempParam: "Air density",
                                paramValue: "46",
                                paramUnit: "Kg/m3"),
                            SizedBox(height: 10),
                            Text("as at ${nowTime()} local time",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
                              color: Colors.blue[200].withOpacity(0.4),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DropdownButton(
                                            dropdownColor: Colors.blueGrey,
                                            underline: Container(),
                                            value: tempDropDownValue,
                                            icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.blue[500]),
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
                              color: Colors.blue[200].withOpacity(0.4),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DropdownButton(
                                            underline: Container(),
                                            dropdownColor: Colors.blueGrey,
                                            value: pressureDropDownValue,
                                            icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.blue[500]),
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
                              color: Colors.blue[200].withOpacity(0.4),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DropdownButton(
                                            underline: Container(),
                                            dropdownColor: Colors.blueGrey,
                                            value: windDropDownValue,
                                            icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.blue[500]),
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
                              color: Colors.blue[200].withOpacity(0.4),
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Center(
                                    child: Text(
                                      "Air density",
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DropdownButton(
                                            underline: Container(),
                                            dropdownColor: Colors.blueGrey,
                                            value: densityDropDownValue,
                                            icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.blue[500]),
                                            items: densityItems
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
                                                densityDropDownValue = newValue;
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
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

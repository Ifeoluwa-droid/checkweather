import 'package:flutter/material.dart';
import 'package:flutter_app/Components/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GetWeatherScreen extends StatefulWidget {
  const GetWeatherScreen({Key key}) : super(key: key);

  @override
  _GetWeatherScreenState createState() => _GetWeatherScreenState();
}

class _GetWeatherScreenState extends State<GetWeatherScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/get-weather.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_outlined),
                    color: Colors.white,
                    iconSize: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 243, 243, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        style: TextStyle(fontFamily: "Inconsolata", fontSize: 20, ),
                        decoration: kTextFieldInputDecoration,
                        onChanged: (value) {
                          cityName = value;
                        },
                      )),
                ),
                TextButton(
                    onPressed: () {
                      if (cityName != null) {
                        Navigator.pop(context, cityName);
                      } else {
                        // display an alert here
                        Alert(
                          context: context,
                          type: AlertType.info,
                          desc: "Enter a Location!",
                          buttons: [
                            DialogButton(child: Text("OK", style: TextStyle(color: Colors.blue, fontSize: 20,)), color: Colors.white, onPressed: () => Navigator.pop(context),)
                          ],
                        ).show();
                      }
                    },
                    child: Text("Get Weather",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 40.0,
                        ))),
              ],
            ),
          )),
    );
  }
}

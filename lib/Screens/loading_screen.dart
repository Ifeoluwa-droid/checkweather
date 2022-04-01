import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/weather_condition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Services/weather.dart';






const apiKey = '27a8e9b8c487a494f190aab2cd4ab57d';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }


  void getLocationData() async {
      try {
        var weatherData = await WeatherModel().getLocationWeather();
        print(weatherData['weather'][0]['main']);
        print(weatherData['name']);
        Navigator.push(context, MaterialPageRoute(builder: (context){return WeatherCondition(locationWeather: weatherData,);}));
      } catch (NoSuchMethodError) {
        Alert(
          context: context,
          type: AlertType.warning,
          desc: "Close the app \n and check Your Internet connection!",
          buttons: [
            DialogButton(child: Text("OK", style: TextStyle(color: Colors.blue, fontSize: 20,)), color: Colors.white, onPressed: () => Navigator.pop(context),)
          ],
        ).show();
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 100.0,
        )
      )
    );
  }
}


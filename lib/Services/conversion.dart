class WeatherUnitsConverter {
  int tempInCelsius;
  var pressureInPa;
  var windSpeedInmps;

  WeatherUnitsConverter({this.tempInCelsius, this.pressureInPa, this.windSpeedInmps});

  int temperatureConverter(newUnit) {
    if (newUnit == "℉") {
      var temp = ((9 / 5) * tempInCelsius + 32);
      return temp.toInt();
    }
    if (newUnit == "K") {
      return tempInCelsius + 273;
    }
    if (newUnit == "℃") {
      return tempInCelsius;
    }
  }

  dynamic pressureConverter(newUnit) {
    if (newUnit == "Bar") {
      return 0.00001 * pressureInPa;
    }
    if (newUnit == "Atm") {
      return pressureInPa / 101325;
    }
    if (newUnit == "Torr") {
      return 0.0075 * pressureInPa;
    }
    if (newUnit == "Pa") {
      return pressureInPa;
    }
  }

  dynamic windConverter(newUnit) {
    if (newUnit == "mph") {
      return 0.621371 * windSpeedInmps;
    }
    if (newUnit == "m/s") {
      return windSpeedInmps;
    }
  }

}
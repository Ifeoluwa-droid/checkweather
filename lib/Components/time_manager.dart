String nowTime() {
  DateTime currentTime = new DateTime.now();
  String hour, meridian;
  String minute = currentTime.minute.toString();

  hour = currentTime.hour > 11 ? currentTime.hour == 12 ? currentTime.hour.toString() : (currentTime.hour - 12).toString() : currentTime.hour == 0 ? "12" : currentTime.hour.toString();
  meridian = currentTime.hour > 11 ? meridian = "PM" :  meridian = "AM";
  minute = minute.length < 2 ? "0" + minute : minute;

  return hour + ":" + minute + " " + meridian;
}

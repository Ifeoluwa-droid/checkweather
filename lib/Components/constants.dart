import 'package:flutter/material.dart';

const kLocationColor = Colors.white70;

final sunnyDayCardColor = Colors.orange[100].withOpacity(0.4);
final rainyDayCardColor = Colors.green[50].withOpacity(0.4);
final cloudyDayCardColor = Colors.blue[200].withOpacity(0.4);
final rainyNightCardColor = Colors.blueGrey.withOpacity(0.4);
final sandyDayCardColor = Colors.brown[200].withOpacity(0.4);

final sunnyDayParamDropdownColor = Colors.orange[500];
final rainyDayParamDropdownColor = Colors.green[500];
final cloudyDayParamDropdownColor = Colors.blueGrey;
final rainyNightParamDropdownColor = Colors.blueGrey;
final sandyDayParamDropdownColor = Colors.brown[300];

final sunnyDayParamDropdownIconColor = Colors.orange[500];
final rainyDayParamDropdownIconColor = Colors.green[500];
final cloudyDayParamDropdownIconColor = Colors.blue[500];
final sandyDayParamDropdownIconColor = Colors.brown[900];
// const rainyNightParamDropdownIconColor = null;

const kTextFieldInputDecoration = InputDecoration(
  border: InputBorder.none,
  prefixIcon: Icon(
    Icons.location_on,
    color: Colors.blueGrey,
  ),
  hintText: "Enter location",
  hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
);

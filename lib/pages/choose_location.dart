import 'package:flutter/material.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/pages/choose_location.dart';
import 'package:weather_app/pages/home.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.grey[200],
      appBar: AppBar
      (
        title: Text("Choose a location"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: Text("Choose Location screen"),
    );
  }
}
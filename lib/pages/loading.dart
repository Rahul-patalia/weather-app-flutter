import 'package:flutter/material.dart';
import 'package:weather_app/services/world_weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> 
{

  void setUpWorldWeather() async
  {
    world_weather weather = world_weather(flag: "au flag", location: "Melbourne", time: "asd", url: "Australia/Melbourne");
    await weather.getWeatherInfo();
    Navigator.pushReplacementNamed(context, "/home",arguments: 
    {
      "location": weather.location,
      "flag": weather.flag,
      "time": weather.time,
      "isDayTime": weather.isDaytime
    });
  }

@override
  void initState() 
  {
    super.initState();
    setUpWorldWeather(); 
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center
      (
        child: SpinKitPulse
        (
          color: Colors.white,
          size: 1000.0,
        ),
      )
    );
  }
}
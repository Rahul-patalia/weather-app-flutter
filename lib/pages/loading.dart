import 'package:flutter/material.dart';
import 'package:weather_app/services/world_weather.dart';



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
      "time": weather.time
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
      body: Padding
      (
        padding: EdgeInsets.all(50.0),
        child: Text('Loading'),
      ),
    );
  }
}
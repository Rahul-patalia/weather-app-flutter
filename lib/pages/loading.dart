import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> 
{

  void getWeatherInfo() async
  {
    // get();
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Australia/Melbourne'));
    Map data = jsonDecode(response.body);
    print(data);
  }

@override
  void initState() 
  {
    super.initState();
    getWeatherInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading"),
    );
  }
}
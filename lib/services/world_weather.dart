import 'package:http/http.dart';
import 'dart:convert';

class world_weather 
{
  String location;
  String time;
  String flag;
  String url;

  world_weather({this.location, this.time, this.url, this.flag});

  Future<void> getWeatherInfo() async
  {
    // get();
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3).toString();

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    time = now.toString();
    
  }
}
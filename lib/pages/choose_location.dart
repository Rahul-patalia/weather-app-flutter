import 'package:flutter/material.dart';
import 'package:weather_app/services/world_weather.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> 
{

  List<world_weather> locations = [
    world_weather(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    world_weather(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    world_weather(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    world_weather(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    world_weather(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    world_weather(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    world_weather(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    world_weather(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    world_weather(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    world_weather(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'australia.png'),
  ];

  void updatetime(index) async
  {
    world_weather weather = locations[index];
    await weather.getWeatherInfo();

    Navigator.pop(context, {
      "location": weather.location,
      "flag": weather.flag,
      "time": weather.time,
      "isDayTime": weather.isDaytime
    } );
  }

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
      body: ListView.builder
      (
        itemCount: locations.length,
        itemBuilder: (context, index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
            child: Card
            (
              child: ListTile
              (
                onTap: () 
                {
                  updatetime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar
                (
                  backgroundImage: AssetImage('Assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      )
    );
  }
}
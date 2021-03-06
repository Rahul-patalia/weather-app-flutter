import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> 
{
  Map Data = {};
  @override
  Widget build(BuildContext context) 
  {

    Data = Data.isNotEmpty ? Data : ModalRoute.of(context).settings.arguments;
    
    String bgImage = Data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = Data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold
    (
      backgroundColor: bgColor,
      body: SafeArea
      (
        child: Container
        (
          decoration: BoxDecoration
          (
            image: DecorationImage
            (
              image: AssetImage('Assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding
          (
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column
            (
              children: <Widget>
              [
                FlatButton.icon
                (
                  onPressed: () async
                  {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      Data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                    print(result);
                  }, 
                  icon: Icon
                  (
                    Icons.location_on_sharp,
                    color: Colors.grey[300],
                  ), 
                  label: Text
                  (
                    "Edit Location",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [
                     Text
                     (
                       Data['location'],
                       style: TextStyle
                       (
                         fontSize: 28.0,
                         letterSpacing: 2.0,
                         color: Colors.grey[300]
                       ),
                     )
                  ],
                ),
              SizedBox(height: 20.0,),
              Text
              (
                Data['time'],
                style: TextStyle
                (
                  fontSize: 66.0,
                  letterSpacing: 0.0,
                  color: Colors.grey[300]
                ),
              ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
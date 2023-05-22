
import 'package:flutter/material.dart';
import 'package:location/location.dart';
// import 'havesine.dart';
import 'dart:async';
import 'dart:math';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    
    double d=0;
    double s=0;
    
  @override
  void initState() {
    super.initState();
    locationService();
  }
   
  Future<void> locationService() async {
    
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionLocation;
    LocationData _locData;

    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionLocation = await location.hasPermission();
    if(_permissionLocation == PermissionStatus.denied) {
      _permissionLocation = await location.requestPermission();
      if(_permissionLocation != PermissionStatus.granted) {
        return;
      }
    }

    _locData = await location.getLocation();
  
    setState(() {
      UserLocation.lats = _locData.latitude!;
      UserLocation.longs = _locData.longitude!;
      UserLocation.late = 0;
      UserLocation.longe = 0;
    });


    

    Timer(Duration(milliseconds:30000), () async {
      _locData = await location.getLocation();
      setState(() {
      UserLocation.late = _locData.latitude!;
      UserLocation.longe = _locData.longitude!;
      d = Haversine.calculateDistance(UserLocation.lats, UserLocation.lats, 
                  UserLocation.late, UserLocation.late);
      d = d * 1000;            
      s=d / 30;
           
      
    });
    });

    

  }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Avarge Speed'),
          backgroundColor: Color.fromARGB(255, 69, 134, 127),
        ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Lat : " + "${UserLocation.lats}"),
                    Text("Long : " + "${UserLocation.longs}" ),
                    ],
                          )
                          
                        ],
                      ),
                    ),

                    Container(
                      
                      height: 200,
                      child: VerticalDivider(
                        thickness: 2.0,
                        indent: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),

                    Container(
                      height: 100,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Lat : " + "${UserLocation.late}"),
                    Text("Long : " + "${UserLocation.longe}" ),
                    ],
                          )
                          
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      
                      padding: EdgeInsets.all(15.0),
                      // margin: EdgeInsets.all(15.0),
                      child:
                      Text('Avarge Speed value is:',
                    style: TextStyle(
                      // width: 300.0,
                      height: 2.0,
                      backgroundColor:  Color.fromARGB(255, 69, 134, 127),
                    ),),
                    )
                    
                  ],
                ),


                Row(
                  
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
              onTap: () {
                
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('${s}'+'m/s'),
                        ]
                    ),
                  
              
              ),
           
                  ],
                ),


                Row(
                  
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   
                      Container(
                        alignment: Alignment.center,
                      width: 100.0,
                      color: Color.fromARGB(255, 69, 134, 127),
                      padding: EdgeInsets.all(4.0),
                      margin: EdgeInsets.all(20.0),
                        child: TextButton(
                        onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SplashScreen()
                        )
                        );
                        },
                        child: Text('Restart',
                        style: TextStyle(
                        
                        height: 2.0,
                        color: Colors.black,
                        backgroundColor:  Color.fromARGB(255, 69, 134, 127),
                                          ),
                        ),
                        ),
                      ),
                    ],
                ),
        ],
      ),
    );
  }
}





class UserLocation {
  static double lats = 0;
  static double longs = 0;
  static double late = 0;
  static double longe = 0;
}



class Haversine {
  static const earthRadius = 6371.0; // In kilometers
  static double calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * asin(sqrt(a));

    final distance = earthRadius * c;

    return distance;
  }

  static double _toRadians(double degrees) {
    return degrees * (pi / 180.0);
  }

  
}



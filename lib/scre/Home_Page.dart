// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'speed.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Avarge Speed'),
        backgroundColor: Color.fromARGB(255, 69, 134, 127),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SplashScreen();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    
                    padding: EdgeInsets.all(15.0),
                    color: Color.fromARGB(255, 69, 134, 127),
                    height: 80.0,
                    // width: double.infinity,
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 40.0,
                        
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      
    );
  }
}

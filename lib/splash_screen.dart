import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'news_home.dart';
class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen1> {
  void initState() {
    super.initState();
    startTime();
  }
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=>NewsHome()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
              'assets/images/splash.jpg',
          ),fit: BoxFit.fill)
        ),
        // child: Center(
        //   child: SplashScreen(
        //       seconds: 5,
        //       navigateAfterSeconds: NewsHome(),
        //       title: new Text('Welcome In SplashScreen'),
        //       //image: new Image.asset('assets/images/splash.jpg'),
        //       backgroundColor: Colors.white,
        //       styleTextUnderTheLoader: new TextStyle(),
        //       photoSize: 100.0,
        //       loaderColor: Colors.red
        //   ),
        // ),
      ),
    );
  }
}

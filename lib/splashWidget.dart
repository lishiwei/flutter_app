import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginPage.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _splashpage();
  }
}

class _splashpage extends State<SplashWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child:Image(image: AssetImage("images/hq_splash.png"),fit: BoxFit.fill,));
  }

  void countDown() {
    var duration = new Duration(seconds: 3);
    Future.delayed(duration).then((_) {
      gotoMain();
    });
  }

  void gotoMain() async{
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool("login");
    if (value == null) {
      Future.delayed(Duration(seconds: 3)).then((_) {
        Navigator.push(context, MaterialPageRoute(builder: (buildContext) {
          return LoginPage();
        }));
      });
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (buildContext) {
        return MyHomePage();
      }));
    }
  }
}
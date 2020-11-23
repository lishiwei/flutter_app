import 'package:flutter/material.dart';
import 'package:flutter_app/page/adopteesgardiantab/adopteesedwidget.dart';
import 'package:flutter_app/page/adopteesgardiantab/readyadopteeswidget.dart';
import 'package:flutter_app/widget/adopter_tab_Bar.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

import 'adopteesgardiantab/alladopteeswidget.dart';

class MyAdopteesGuardian extends StatefulWidget {
  @override
  _MyAdopteesGuardianState createState() => _MyAdopteesGuardianState();
}

class _MyAdopteesGuardianState extends State<MyAdopteesGuardian>  {
  List<TabEntry> tabs = [
    TabEntry("全部", "60"),
    TabEntry("待领养", "20"),
    TabEntry("已领养", "20"),
  ];
  List<Widget> pageViews = [
    Alladoptees(),
    Alladoptees(),
    Alladoptees(),
  ];

  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("我的送养", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: InkWell(
            child: Image(image: AssetImage("images/icon_back.png"),),
            onTap: () {
              Navigator.pop(context);
            },),
          centerTitle: true,
        ),
        body: AdopterTabBar(tabs, pageViews));
  }
}

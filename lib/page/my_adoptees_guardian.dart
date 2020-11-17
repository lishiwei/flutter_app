import 'package:flutter/material.dart';
import 'package:flutter_app/widget/adopter_tab_Bar.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class MyAdopteesGuardian extends StatefulWidget {
  @override
  _MyAdopteesGuardianState createState() => _MyAdopteesGuardianState();
}

class _MyAdopteesGuardianState extends State<MyAdopteesGuardian>
    {

  List<TabEntry> tabs = [TabEntry("全部","60"),TabEntry("待领养","20"),TabEntry("已领养","20"),];
  List<Widget> pageViews = [Text("data"),Text("data"),Text("data"),];

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
      appBar: AppBar(title: Text("我的送养"),centerTitle: true,),
      body:
        AdopterTabBar(tabs,pageViews)

    );
  }
}

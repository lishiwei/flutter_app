import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Adapt.dart';
import 'package:flutter_app/tab/allWidget.dart';
import 'package:flutter_app/tab/catWidget.dart';
import 'package:flutter_app/tab/dogWidget.dart';

class AdoptWidget extends StatefulWidget {
  @override
  AdoptState createState() {
    return new AdoptState();
  }
}

class AdoptState extends State<AdoptWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  TabController controller;

  void change(String value) {}

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  Widget getTabBar() {

    return TabBar(
      tabs: <Tab>[
        Tab(
          text: "全部",
        ),
        Tab(
          text: "喵",
        ),
        Tab(
          text: "汪",
        ),
      ],
      controller: controller,
      labelColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 0,right: 0,top: 20,bottom: 20),
              margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
              child: TextField(
                decoration: InputDecoration(hintText: "请输入您喜欢的动物"),
              ),
            )
            ,
            Image(image: NetworkImage("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1335297313,1289367892&fm=26&gp=0.jpg"),),
           getTabBar(),
            Expanded(
              child: getTabBarView([AllWidget(),CatWidget(),DogWidget()]),
            ),
          ],
        ),
      ),
    );
  }
}

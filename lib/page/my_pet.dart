import 'package:flutter/material.dart';
import 'package:flutter_app/page/adopteesgardiantab/alladopteeswidget.dart';
import 'package:flutter_app/page/mypet/allpet_widget.dart';
import 'package:flutter_app/page/mypet/my_cat_widget.dart';
import 'package:flutter_app/page/mypet/my_dog_widget.dart';
import 'package:flutter_app/tab/catWidget.dart';
import 'package:flutter_app/tab/dogWidget.dart';

class Mypet extends StatefulWidget {
  Mypet({Key key}) : super(key: key);

  @override
  _MypetState createState() => _MypetState();
}

class _MypetState extends State<Mypet>  with SingleTickerProviderStateMixin {
  TabController controller;

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          text: "全部",
        ),
        Tab(
          text: "喵",

        ),
        Tab(
          text: "汪",
        ),
      ],
      labelColor: Colors.black,
      indicatorColor: Colors.red,
      unselectedLabelColor: Colors.grey[600],
      controller: controller,
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);

  }
  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }
  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "我的宠物",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: InkWell(
          child: Image(
            image: AssetImage("images/icon_back.png"),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        bottom:getTabBar() ,
      ),
      body: getTabBarView(<Widget>[AllpetWidget(), MyCatWidget(), MyDogWidget()])
      ,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Adapt.dart';
import 'package:flutter_app/tab/allWidget.dart';
import 'package:flutter_app/tab/catWidget.dart';
import 'package:flutter_app/tab/dogWidget.dart';
import 'file:///D:/githubstudyproject/flutter_app/lib/page/search_result_page.dart';
import 'package:flutter_app/utils/StickyTabBarDelegate.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdopterWidget extends StatefulWidget {
  @override
  TestAdopterState createState() {
    return new TestAdopterState();
  }
}

class TestAdopterState extends State<AdopterWidget>
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
void onSearch(String content){

    if (content.isEmpty) {
    Fluttertoast.showToast(msg: "输入内容不可以为空");
    } else{
      Navigator.push(
          context, MaterialPageRoute(builder: (context) {
        return SearchResultPage.name(content);
      }));
    }
}
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              expandedHeight: 250,
              floating: true,
              pinned: true,
              title: TextField(
                onSubmitted: onSearch,
                decoration: InputDecoration(
                    hintText: "请输入您喜欢的动物",
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image(
                  image: NetworkImage(
                      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1335297313,1289367892&fm=26&gp=0.jpg"),
                  fit: BoxFit.cover,
                ),
              ),

              ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: getTabBar(),
            ),
          ),
        ];
      },
      body: getTabBarView([AllWidget(), CatWidget(), DogWidget()]),
    );
  }
}

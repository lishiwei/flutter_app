import 'package:flutter/material.dart';
import 'package:flutter_app/loginPage.dart';
import 'package:flutter_app/splashWidget.dart';
import 'package:flutter_app/tab/AdopterWidget.dart';
import 'package:flutter_app/tab/myWidget.dart';
import 'file:///D:/githubstudyproject/flutter_app/lib/page/public_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    // read1();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: SplashWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
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

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          text: "领养",
        ),
        Tab(
          text: "发布",

        ),
        Tab(
          text: "我的",

        ),
      ],
      controller: controller,
      indicatorWeight: 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.


    return Scaffold(


      body: getTabBarView(<Widget>[AdopterWidget(), PublicWidget(), MyWidget()]),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: getTabBar(),
      ),
    );
  }
}

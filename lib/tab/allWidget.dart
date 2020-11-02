import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllWidget extends StatefulWidget {

  @override
  AllState createState() {
    return new AllState();
  }
}

class AllState extends State<AllWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("全部"),);
  }
}
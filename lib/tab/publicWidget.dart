import 'package:flutter/cupertino.dart';

class PublicWidget extends StatefulWidget {

  @override
  PublicState createState() {
    return new PublicState();
  }
}

class PublicState extends State<PublicWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("我的", textDirection: TextDirection.ltr));
  }
}
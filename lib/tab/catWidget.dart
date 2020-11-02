import 'package:flutter/cupertino.dart';

class CatWidget extends StatefulWidget {

  @override
  CatState createState() {
    return new CatState();
  }
}

class CatState extends State<CatWidget> {
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
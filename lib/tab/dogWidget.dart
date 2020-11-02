import 'package:flutter/cupertino.dart';

class DogWidget extends StatefulWidget {

  @override
  DogState createState() {
    return new DogState();
  }
}

class DogState extends State<DogWidget> {
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
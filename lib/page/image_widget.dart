import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String url;

  ImageWidget(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(child: Image(image: NetworkImage(url),),);
  }
}

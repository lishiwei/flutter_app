import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  String leftTips = "";
  String rightTips = "";
  bool editable = true;
  Function() tapAction;
  Function(String content) onInputChange;

  MyInputField.Tap(
      this.leftTips, this.rightTips, this.editable, this.tapAction);

  MyInputField.Edit(this.leftTips, this.rightTips, this.onInputChange);

  @override
  Widget build(BuildContext context) {
    Widget right;
    if (editable) {
      right = ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 50, maxWidth: 100),
        child: TextField(
          textAlign: TextAlign.center,
          onSubmitted: onInputChange,
          maxLines: 1,
          maxLengthEnforced: true,
          decoration: InputDecoration(
              border: InputBorder.none,

              hintText: rightTips, hintStyle: TextStyle(fontSize: 12)),
        ),
      );
    } else {
      right = InkWell(
        child: Text(rightTips),
        onTap: () {
          tapAction.call();
        },
      );
    }
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(leftTips),
                Expanded(child: Text("1")),
                right,
                Image(
                  image: AssetImage("images/icon_next_gray.png"),
                  width: 20,
                  height: 20,
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,

          )
        ],
      ),
    );
  }
}

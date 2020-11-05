import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/FlowLayout.dart';

class SelectPetPage extends StatefulWidget {
  SelectPetPage({Key key}) : super(key: key);

  @override
  _SelectPetPageState createState() {
    return _SelectPetPageState();
  }
}

class _SelectPetPageState extends State<SelectPetPage>
    implements OnItemClickListener {
  List<String> variety = ["全部", "喵", "汪"];
  List<String> sexy = ["全部", "男", "女"];
  List<String> age = ["全部", "0-1岁", "1-3岁", ">3岁"];
  List<String> medicalCondition = ["全部", "已绝育", "已免疫", "已驱虫"];
  List<int> initSelectedIndex = [0, 1, 2, 3];
int initIndex= 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  onItemClick(List<String> list) {}

  void onResetClick() {
    print("aaaaaaaaaaa");
    setState(() {
      initSelectedIndex = [0, 0, 0, 0];
      initIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("筛选"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(4)),
                Text("品牌"),
                FlowLayout(
                  list: variety,
                  // selectColor: Colors.yellow,
                  listener: this,
                  initSelectIndex: initIndex,
                  maxSelectSize: 1,
                ),
                SelectPetItemWidget.name(sexy, "性别" ,initIndex,this),
                SelectPetItemWidget.name(age, "年龄", initIndex, this,),
                SelectPetItemWidget.name(
                    medicalCondition, "医疗状况",initIndex, this,)
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.grey[300],
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text(
                        "重置",
                        style: TextStyle(color: Colors.white),
                      ),
                      margin: EdgeInsets.all(4),
                      padding:
                          EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                      decoration: new BoxDecoration(
                        color: Colors.grey,
                        borderRadius: new BorderRadius.circular((14.0)), // 圆角度
                      )),
                  onTap:onResetClick,
                ),
                InkWell(
                  child: Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text(
                        "确定",
                        style: TextStyle(color: Colors.white),
                      ),
                      margin: EdgeInsets.all(4),
                      padding:
                          EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                      decoration: new BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: new BorderRadius.circular((14.0)), // 圆角度
                      )),
                  onTap: () => {Navigator.pop(context)},
                ),
              ],
            ),
          ))
        ],
      ),
    );
    ;
  }
}
class SelectPetItemWidget extends StatefulWidget {
  SelectPetItemWidget({Key key}) : super(key: key);

  SelectPetItemWidget.name(
      this.list, this.title, this.initSelectIndex, this.onItemClickListener);

  List<String> list = ["全部", "喵", "汪"];
  String title;
  int initSelectIndex;
  OnItemClickListener onItemClickListener;

  @override
  _SelectPetItemWidgetState createState() {
    return _SelectPetItemWidgetState.name(list, title, initSelectIndex, onItemClickListener);
  }
}

class _SelectPetItemWidgetState extends State<SelectPetItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _SelectPetItemWidgetState.name(
      this.list, this.title, this.initSelectIndex, this.onItemClickListener);

  List<String> list ;
  String title;
  int initSelectIndex;
  OnItemClickListener onItemClickListener;

  @override
  onItemClick(List<String> list) {
    onItemClickListener.onItemClick(list);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(4)),
        Text(title),
        FlowLayout(
          list: list,
          // selectColor: Colors.yellow,
          listener: onItemClickListener,
          initSelectIndex: initSelectIndex,
          maxSelectSize: 1,
        )
      ],
    );
  }
}


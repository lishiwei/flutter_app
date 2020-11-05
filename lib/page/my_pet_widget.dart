import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/tab/myWidget.dart';
import 'package:flutter_app/widget/my_input_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyPetWidget extends StatefulWidget {
  MyPetWidget({Key key}) : super(key: key);

  @override
  _MyPetWidgetState createState() => _MyPetWidgetState();
}

class _MyPetWidgetState extends State<MyPetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("编辑宠物信息"),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          padding: EdgeInsets.all(0.0),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              MyInputField.Edit("性别", "男生",
                  (content) => {Fluttertoast.showToast(msg: content)}),
              MyInputField.Edit("品种", "喵-中华田园猫",
                  (content) => {Fluttertoast.showToast(msg: "bbbb")}),
              MyInputField.Tap("年龄", "1岁6个月", false,
                  () => {Fluttertoast.showToast(msg: "ccc")}),
              MyInputField.Tap("体重", "4kg", false,
                  () => {Fluttertoast.showToast(msg: "dddd")}),
              MyInputField.Tap("所在地", "上海市  长宁区", false,
                  () => {Fluttertoast.showToast(msg: "dddd")}),
              Container(
                decoration: BoxDecoration(color: Colors.grey[300]),
                transform: Matrix4.translationValues(0, -2, 0),
                height: 50,
                child: Text("医疗信息"),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
              ),
              MyInputField.Edit("是否绝育", "已绝育",
                  (content) => {Fluttertoast.showToast(msg: content)}),
              MyInputField.Edit("绝育时间", "2020-10-31",
                  (content) => {Fluttertoast.showToast(msg: content)}),
              MyInputField.Edit("是否注射疫苗", "毛三联，第二针：狂犬疫苗",
                  (content) => {Fluttertoast.showToast(msg: content)}),
              MyInputField.Edit("是否驱虫", "已驱虫",
                  (content) => {Fluttertoast.showToast(msg: content)}),
              MyInputField.Edit("上次驱虫时间", "2020-02-02",
                  (content) => {Fluttertoast.showToast(msg: content)}),
              Container(
                  color: Colors.grey[300],
                  padding:
                      EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 10),
                            child: Text(
                              "删除动物",
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.grey,

                              borderRadius:
                                  new BorderRadius.circular((6.0)), // 圆角度
                            )),
                        onTap: () {
                          Navigator.of(context).pop();

                        },
                      ),
                      InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 40, right: 40, bottom: 10),
                            decoration: new BoxDecoration(
                              color: Colors.orange,

                              borderRadius:
                                  new BorderRadius.circular((6.0)), // 圆角度
                            ),
                            child: Text(
                              "保存",
                              style: TextStyle(color: Colors.white),
                            )),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ))
            ],
          ),
        ));
    ;
  }
}

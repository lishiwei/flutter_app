import 'package:flutter/material.dart';
import 'package:flutter_app/page/adopteesgardiantab/alladopteeswidget.dart';
import 'package:flutter_app/page/myapply/my_apply_all_widget.dart';
import 'package:flutter_app/widget/adopter_tab_Bar.dart';

class MyApply extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyApplyState();
  }
}

class MyApplyState extends State<MyApply> {
  Employee employee;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employee = Employee(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        "我是主子名",
        "1岁6个月",
        "喵",
        "待领养",
        "已有10人申请",
        "8");
  }

  List<TabEntry> tabs = [
    TabEntry("全部", "60"),
    TabEntry("待领养", "20"),
    TabEntry("已领养", "20"),
  ];
  List<Widget> pageViews = [
    MyApplyAll(),
    Text("data"),
    Text("data"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "申请列表",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: InkWell(
          child: Image(
            image: AssetImage("images/icon_back.png"),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.only(left: 12),
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Row(
              children: [
                Image(image: AssetImage("images/icon_laba.png")),
                Text("为动物安全，建议同意领养前，先联系并合适信息哦")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      child: Image(
                        image: NetworkImage(
                            employee.photo),
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(employee.name,
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            Padding(padding: EdgeInsets.all(4)),
                            Container(
                                child: Center(
                                  child: Text("喵",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    shape: BoxShape.circle))
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage(
                                  "images/icon_arrow_women.png"),
                              height: 20,
                              width: 20,
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(employee.age)
                          ],
                        )
                      ],
                    ),
                    Expanded(child: Text("")),
                    Text(
                      "待领养",
                      style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.all(12)),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
                Padding(padding: EdgeInsets.all(6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "查看3条已发布",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Image(image: AssetImage("images/icon_next_gray.png"),
                      height: 20,
                      width: 20,)
                  ],
                ),
                Padding(padding: EdgeInsets.all(6)),


              ],
            ),
          ),
          Expanded(child: Scaffold(body: AdopterTabBar(tabs, pageViews),)),

        ],

      )
      // body: test(),
    );
  }

  Widget test() {
    return new CustomScrollView(shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.only(left: 12),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Row(
                    children: [
                      Image(image: AssetImage("images/icon_laba.png")),
                      Text("为动物安全，建议同意领养前，先联系并合适信息哦")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            child: Image(
                              image: NetworkImage(
                                  employee.photo),
                              height: 40,
                              width: 40,
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(employee.name,
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Container(
                                      child: Center(
                                        child: Text("喵",
                                            style: TextStyle(
                                                fontSize: 12, color: Colors.white)),
                                      ),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          shape: BoxShape.circle))
                                ],
                              ),
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "images/icon_arrow_women.png"),
                                    height: 20,
                                    width: 20,
                                  ),
                                  Padding(padding: EdgeInsets.all(2)),
                                  Text(employee.age)
                                ],
                              )
                            ],
                          ),
                          Expanded(child: Text("")),
                          Text(
                            "待领养",
                            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(12)),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                      Padding(padding: EdgeInsets.all(6)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "查看3条已发布",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Image(image: AssetImage("images/icon_next_gray.png"),
                            height: 20,
                            width: 20,)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(6)),


                    ],
                  ),
                ),
                Expanded(child: Scaffold(body: AdopterTabBar(tabs, pageViews),)),

              ]),
            ),
          )
        ]);
  }
}

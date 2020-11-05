import 'dart:core';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Adapt.dart';
import 'package:flutter_app/Bean/Pet.dart';

import '../page/my_pet_widget.dart';

class MyWidget extends StatefulWidget {
  @override
  MyState createState() {
    return new MyState();
  }
}

class MyState extends State<MyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget getCatItem(CatBean catBean) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                      image: NetworkImage(
                          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2620302238,382482214&fm=26&gp=0.jpg"),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Column(
                    children: <Widget>[Text("我是主子名"), Text("1岁6 个月")],
                  )
                ],
              ),
            ),
            Image(
              image: AssetImage("images/icon_next_gray.png"),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (buildContext) {
          return MyPetWidget();
        }));
      },
    );
  }

  List<CatBean> cats = [
    CatBean("aa", "aa", "aa", "aa"),
    CatBean("aa", "aa", "aa", "aa"),
    CatBean("aa", "aa", "aa", "aa")
  ];
  List<PetAdoptionBean> petAdoptions = [
    PetAdoptionBean("我的送养", "8"),
    PetAdoptionBean("我的申请", "0"),
    PetAdoptionBean("我的收藏", "0"),
    PetAdoptionBean("领养问卷", "0")
  ];

  Widget getBadgeWidget(int number) {
    if (number == 0) {
      return Text("");
    } else {
      return Badge(
        badgeContent: Text(number.toString()),
      );
    }
  }

  Widget getPetAdoptionItem(PetAdoptionBean petAdoptionBean) {
    return Stack(children: <Widget>[
      Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            petAdoptionBean.title,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(4),
        child: Align(
          // child: Text(petAdoptionBean.number,style: TextStyle(color: Colors.red),),
          child: getBadgeWidget(int.parse(petAdoptionBean.number)),
          alignment: Alignment.topRight,
        ),
      )
    ]);
  }

  Widget getPetAdpot() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("   宠物领养"),
            Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // 注意，使用了GridView.builder，又要设置网格属性的话，要用这个属性！
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 3 / 1),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: petAdoptions.length,
                itemBuilder: (context, index) {
                  return getPetAdoptionItem(petAdoptions[index]);
                },
              ),
              padding:
                  EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            )
          ],
        ));
  }

  Widget getMenu() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    "images/icon_home_message.png",
                  ),
                  height: 30,
                  width: 30,
                ),
                Text("加入志愿者"),
                Expanded(child: Text("")),
                Image(
                  image: AssetImage("images/icon_next_gray.png"),
                  height: 30,
                  width: 30,
                )
              ],
            ),
            height: 50,
          ),
          Divider(height: 2, color: Colors.blueGrey),
          Container(
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    "images/icon_home_message.png",
                  ),
                  height: 30,
                  width: 30,
                ),
                Text("设置"),
                Expanded(child: Text("")),
                Image(
                  image: AssetImage("images/icon_next_gray.png"),
                  height: 30,
                  width: 30,
                )
              ],
            ),
            height: 50,
          ),
          Divider(height: 2, color: Colors.blueGrey),
          Container(
            height: 50,
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    "images/icon_home_message.png",
                  ),
                  height: 30,
                  width: 30,
                ),
                Text("使用说明"),
                Expanded(child: Text("")),
                Image(
                  image: AssetImage("images/icon_next_gray.png"),
                  height: 30,
                  width: 30,
                )
              ],
            ),
          ),
          Divider(height: 2, color: Colors.blueGrey),
          Container(
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    "images/icon_home_message.png",
                  ),
                  height: 30,
                  width: 30,
                ),
                Text("联系客服"),
                Expanded(child: Text("")),
                Image(
                  image: AssetImage("images/icon_next_gray.png"),
                  height: 30,
                  width: 30,
                )
              ],
            ),
            height: 50,
          )
        ],
      ),
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                padding:
                    EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: (Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage("images/icon_famale.png"),
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 10, top: 5, right: 0, bottom: 0),
                            child: Column(
                              children: <Widget>[Text("aaa"), Text("wwwwwwww")],
                            ),
                          )
                        ],
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300], width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage("images/icon_mail.png"),
                            height: 30,
                            width: 30,
                          ),
                          Text("消息通知")
                        ],
                      ),
                      margin: EdgeInsets.only(
                          left: 0, right: 00, top: 00, bottom: 0),
                      padding:
                          EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                    )
                  ],
                ),
                height: 180,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[300],
                ),
              )
            ],
          ),
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: true,
              padding: EdgeInsets.all(0.0),
              physics: BouncingScrollPhysics(),
              child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 110, bottom: 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(children: <Widget>[
                              Container(
                                child: Text("我的宠物"),
                                margin: EdgeInsets.only(
                                    left: 10, right: 0, top: 0, bottom: 0),
                              ),
                              Container(
                                child: Image(
                                  image: AssetImage("images/icon_add.png"),
                                  width: 20,
                                  height: 20,
                                ),
                                margin: EdgeInsets.only(
                                    left: 10, right: 0, top: 0, bottom: 0),
                              )
                            ]),
                          ),
                          Text("aaaa"),
                          Image(
                            image: AssetImage("images/icon_next_gray.png"),
                          )
                          // Expanded(child: Text("")),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 2,
                            color: Colors.grey,
                          );
                        },
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cats.length,
                        itemBuilder: (_, index) {
                          return getCatItem(cats.elementAt(index));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    getPetAdpot(),
                    getMenu()
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



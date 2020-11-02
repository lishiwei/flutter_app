import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Adapt.dart';

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
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(

        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Image(
                  image: NetworkImage(
                      "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2620302238,382482214&fm=26&gp=0.jpg"),
                  height: 50,
                  width: 50,
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
    );
  }

  List<CatBean> cats = [
    CatBean("aa", "aa", "aa", "aa"),
    CatBean("aa", "aa", "aa", "aa"),
    CatBean("aa", "aa", "aa", "aa")
  ];
  List<PetAdoptionBean> petAdoptions = [
    PetAdoptionBean("我的送养", "8"),
    PetAdoptionBean("我的申请", ""),
    PetAdoptionBean("我的收藏", ""),
    PetAdoptionBean("领养问卷", "")
  ];

  Widget getPetAdoptionItem(PetAdoptionBean petAdoptionBean) {
    return
    Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey,
        
        borderRadius: BorderRadius.all(Radius.circular(10))),

      child:Center(
        child: Text(petAdoptionBean.title,),
      ) ,
    )
       ;

  }

  Widget getfeed() {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child:  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  // 注意，使用了GridView.builder，又要设置网格属性的话，要用这个属性！
    crossAxisCount: 2,
    mainAxisSpacing: 0.0,
    crossAxisSpacing: 0.0,
        childAspectRatio: 3/1
    ),
    shrinkWrap: true,

        physics: NeverScrollableScrollPhysics(),
    itemCount: petAdoptions.length,
        itemBuilder: (context,index){

        return getPetAdoptionItem(petAdoptions[index]);
        },
    ));
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
                          border: Border.all(color: Colors.grey, width: 1),
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
                  color: Colors.white,
                ),
              )
            ],
          ),
          Scrollbar(child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            padding: EdgeInsets.all(0.0),
            physics: BouncingScrollPhysics(),
            child:  Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 110, bottom: 0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Column(
                children: <Widget>[
                  Container(

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
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),

                      children: cats
                          .map<Widget>((catBean) => getCatItem(catBean))
                          .toList(),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),),
                  getfeed(),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),)

        ],
      ),
    );
  }
}

class CatBean {
  String name;
  String url;
  String age;
  String sex;

  CatBean(this.name, this.url, this.age, this.sex);
}

class PetAdoptionBean {
  String title;
  String number;

  PetAdoptionBean(this.title, this.number);
}

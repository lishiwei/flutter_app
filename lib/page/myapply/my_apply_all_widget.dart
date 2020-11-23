import 'package:flutter/material.dart';

class MyApplyAll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyApplyAllState();
  }
}

class MyApplyAllState extends State<MyApplyAll> {
  List<ApplyPersonInfo> list = [
    ApplyPersonInfo(
        "路人丁",
        "https://timgsa.baidu.com/timg?image&quality=93&size=b9999_10000&sec=1604403648303&di=29945bb42a08e561182ed4daec51335f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201612%2F14%2F20161214221249_cCF4z.jpeg",
        "04-11 ：26 申请",
        "我的名字",
        "26岁",
        "上海市长宁区",
        "18601704731",
        "weixinhao",
        "无",
        "申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字",
        ""),  ApplyPersonInfo(
        "路人丁",
        "https://timgsa.baidu.com/timg?image&quality=93&size=b9999_10000&sec=1604403648303&di=29945bb42a08e561182ed4daec51335f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201612%2F14%2F20161214221249_cCF4z.jpeg",
        "04-11 ：26 申请",
        "我的名字",
        "26岁",
        "上海市长宁区",
        "18601704731",
        "weixinhao",
        "无",
        "申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字",
        ""),  ApplyPersonInfo(
        "路人丁",
        "https://timgsa.baidu.com/timg?image&quality=93&size=b9999_10000&sec=1604403648303&di=29945bb42a08e561182ed4daec51335f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201612%2F14%2F20161214221249_cCF4z.jpeg",
        "04-11 ：26 申请",
        "我的名字",
        "26岁",
        "上海市长宁区",
        "18601704731",
        "weixinhao",
        "无",
        "申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字申请理由最多45字",
        ""),
  ];

  Widget getItem(ApplyPersonInfo applyPersonInfo) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image(
                  image: NetworkImage(applyPersonInfo.photo),
                  height: 40,
                  width: 40,
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Text(
                applyPersonInfo.name,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Expanded(
                child: Text(""),
              ),
              Text(
                "04-25 11:26 申请",
                style: TextStyle(color: Colors.orange, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                width: 93,
                child: Text(
                  "姓名",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text(applyPersonInfo.name),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                width: 93,
                child: Text(
                  "年龄",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text(applyPersonInfo.age),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                width: 93,
                child: Text(
                  "所在地",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text(applyPersonInfo.address),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                width: 93,
                child: Text(
                  "手机",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text(applyPersonInfo.phoneNumber),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                width: 93,
                child: Text(
                  "微信",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text(applyPersonInfo.wechat),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                width: 93,
                child: Text(
                  "邮箱",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text(applyPersonInfo.email),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 93,
                child: Text(
                  "申请理由",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Expanded(
                  child: Text(
                    applyPersonInfo.reason,
                  )),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                width: 93,
                child: Text(
                  "领养问卷",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text("查看问卷详情"),
            ],
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[300],),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,

    children: [
            InkWell(child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 12),
                height: 40,
                child: Center(
                  child: Text("不通过",
                      style:
                      TextStyle(fontSize: 16, color: Colors.white)),
                ),
                decoration: BoxDecoration(
                    color: Color(0x88888888),
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
              onTap: () {

              },), InkWell(child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 12),
                height: 40,
                child: Center(
                  child: Text("通过",
                      style:
                      TextStyle(fontSize: 16, color: Colors.white)),
                ),
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
              onTap: () {

              },)
          ],)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return Divider(
          height: 10,
          color: Colors.grey[500],
          thickness: 10,
        );
      },
      itemCount: list.length,
      itemBuilder: (_, index) {
        return getItem(list[index]);
      },
    );
  }
}

class ApplyPersonInfo {
  String name;
  String photo;
  String time;
  String nickName;
  String age;
  String address;
  String phoneNumber;
  String wechat;
  String email;
  String reason;
  String page;

  ApplyPersonInfo(this.name,
      this.photo,
      this.time,
      this.nickName,
      this.age,
      this.address,
      this.phoneNumber,
      this.wechat,
      this.email,
      this.reason,
      this.page);
}

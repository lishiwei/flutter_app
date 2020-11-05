import 'package:flutter/material.dart';
import 'package:flutter_app/Bean/Pet.dart';
import 'package:flutter_app/tab/allWidget.dart';
import 'package:flutter_app/utils/onPetItemClick.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'InputDialog.dart';

class PetItemWidget extends StatefulWidget {
  PetItemWidget({Key key}) : super(key: key);

  PetItemWidget.name(this.adoptInfo, this.onPetItemClick);

  AdoptInfo adoptInfo;

  OnPetItemClick onPetItemClick;

  @override
  _PetItemWidgetState createState() {
    return _PetItemWidgetState(adoptInfo, onPetItemClick);
  }
}

class _PetItemWidgetState extends State<PetItemWidget> {
  @override
  void initState() {
    super.initState();
    _vc = TextEditingController(text: "初始化的");
  }

  @override
  void dispose() {
    super.dispose();
  }

  _PetItemWidgetState(this.adoptInfo, this.onPetItemClick);

  AdoptInfo adoptInfo;

  OnPetItemClick onPetItemClick;
  TextEditingController _vc;

  Widget getPetPhotoItem(String url) {
    return InkWell(
      child: Image(
        image: NetworkImage(url),
        fit: BoxFit.fill,
      ),
      onTap: () => {onPetItemClick.onPetPhotoClick(url)},
    );
  }

  Widget getStatus(String status) {
    return Container(
        child: Text(
          status,
          style: TextStyle(color: Colors.white),
        ),
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
        decoration: new BoxDecoration(
          color: Colors.grey,
          borderRadius: new BorderRadius.circular((4.0)), // 圆角度
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image(
                  image: NetworkImage(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604403648303&di=29945bb42a08e561182ed4daec51335f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201612%2F14%2F20161214221249_cCF4z.jpeg"),
                  height: 40,
                  width: 40,
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Text(
                adoptInfo.publisherName,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Text(
                adoptInfo.relationShip,
                style: TextStyle(color: Colors.orange, fontSize: 14),
              ),
              Expanded(child: Text("")),
              Text(adoptInfo.time)
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // 注意，使用了GridView.builder，又要设置网格属性的话，要用这个属性！
                crossAxisCount: 3,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1 / 1),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: adoptInfo.petPhotos.length,
            itemBuilder: (context, index) {
              return getPetPhotoItem(adoptInfo.petPhotos[index]);
            },
          ),
          Padding(padding: EdgeInsets.all(8)),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          Padding(padding: EdgeInsets.all(8)),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
                  ),
                  height: 50,
                  width: 50,
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    adoptInfo.petName,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text(adoptInfo.petAge),
                      Padding(padding: EdgeInsets.all(4)),
                      Text(adoptInfo.petAddress)
                    ],
                  ),
                  Row(
                    children: adoptInfo.petTips
                        .map<Widget>((status) => getStatus(status))
                        .toList(),
                  )
                ],
              ),
              Expanded(child: Text("")),
              Container(
                child: Text(adoptInfo.petAdpotStatus,
                    style: TextStyle(color: Colors.white)),
                decoration: new BoxDecoration(
                  color: Colors.orange,

                  borderRadius: new BorderRadius.circular((10.0)), // 圆角度
                ),
                padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          Padding(padding: EdgeInsets.all(8)),
          Row(
            children: [
              Expanded(
                child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getCollectImage(),
                        Padding(padding: EdgeInsets.all(2)),
                        Text(
                          "收藏",
                        )
                      ],
                    ),
                    onTap: () => {collectClick()}),
              ),
              Expanded(
                  child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("images/icon_comment.png"),
                      height: 20,
                      width: 20,
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    Text("评论")
                  ],
                ),
                onTap: () => {showInputDialog()},
              )),
              Expanded(
                child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("images/icon_share.png"),
                          height: 20,
                          width: 20,
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Text("分享")
                      ],
                    ),
                    onTap: () => {onPetItemClick.onShareClick(adoptInfo)}),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(4)),
        ],
      ),
    );
  }

  Widget getCollectImage() {
    if (!adoptInfo.isCollected) {
      return Image(
        image: AssetImage("images/icon_collect.png"),
        height: 20,
        width: 20,
      );
    } else {
      return Image(
        image: AssetImage("images/icon_collected.png"),
        height: 20,
        width: 20,
      );
    }
  }

  void showInputDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return RenameDialog(
            contentWidget: RenameDialogContent(
              title: "请输入您的评论",
              okBtnTap: () {
                print(
                  Fluttertoast.showToast(msg: _vc.text)
                );
                onPetItemClick.onCommentClick(adoptInfo);
              },
              vc: _vc,
              cancelBtnTap: () {},
            ),
          );
        });
  }

  void collectClick() {
    if (adoptInfo.isCollected) {
      setState(() {
        adoptInfo.isCollected = false;
      });
      onPetItemClick.onCancelCollectClick(adoptInfo);
    } else {
      setState(() {
        adoptInfo.isCollected = true;
      });
      onPetItemClick.onCollectClick(adoptInfo);
    }
  }
}

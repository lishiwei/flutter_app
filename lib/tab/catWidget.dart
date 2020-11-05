import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Bean/Pet.dart';
import 'package:flutter_app/utils/onPetItemClick.dart';

import '../widget/PetListWidget.dart';

class CatWidget extends StatefulWidget {

  @override
  CatState createState() {
    return new CatState();
  }
}

class CatState extends State<CatWidget> implements OnPetItemClick{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  List<AdoptInfo> list = [
    AdoptInfo(
        "vickeyWang",
        "",
        "助养人",
        "3分钟前",
        "我是帖子我是帖子我是帖子我是帖子我是帖子我是帖子我是帖子我是帖子我是帖子我是帖子我是帖子",
        [
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1098967377,261713346&fm=26&gp=0.jpg",
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=501352901,2568295072&fm=26&gp=0.jpg",
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=501352901,2568295072&fm=26&gp=0.jpg",
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        ],
        ["已绝育", "已免疫", "已驱虫"],
        "汪汪",
        "1岁6个月",
        "男",
        "上海市长宁区",
        "我要领养",false,[
      Comment(
          "王梦灵",
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604403648303&di=29945bb42a08e561182ed4daec51335f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201612%2F14%2F20161214221249_cCF4z.jpeg",
          "3分钟前",
          "好漂亮啊"),
      Comment(
          "李市伟",
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604403648303&di=29945bb42a08e561182ed4daec51335f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201612%2F14%2F20161214221249_cCF4z.jpeg",
          "3分钟前",
          "好帅气啊")
    ]),

  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PetListWidget.name(list,this);
  }

  @override
  void onPetPhotoClick(String url) {

  }

  @override
  void onCollectClick(AdoptInfo adoptInfo) {

  }

  @override
  void onShareClick(AdoptInfo adoptInfo) {

  }

  @override
  void onCommentClick(AdoptInfo adoptInfo) {

  }

  @override
  void onCancelCollectClick(AdoptInfo adoptInfo) {

  }

  @override
  void onAdpotClick(AdoptInfo adoptInfo) {

  }
}
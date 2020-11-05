import 'package:flutter/material.dart';
import 'package:flutter_app/Bean/Pet.dart';
import 'package:flutter_app/utils/onPetItemClick.dart';
import 'package:flutter_app/widget/pet_item_widget.dart';

import '../widget/PetListWidget.dart';

class SearchResultPage extends StatefulWidget {
  String content;

  SearchResultPage({Key key}) : super(key: key);

  SearchResultPage.name(this.content);

  @override
  _SearchResultPageState createState() => _SearchResultPageState(content);
}

class _SearchResultPageState extends State<SearchResultPage>
    implements OnPetItemClick {
  String content;

  _SearchResultPageState(this.content);

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
        "我要领养",
        false,
        [
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
    return Scaffold(
        appBar: AppBar(
          title: Text(content),
          backgroundColor: Colors.red,
        ),
        body: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Divider(
              height: 10,
              color: Colors.grey[300],
              thickness: 10,
            );
          },
          itemCount: list.length,
          itemBuilder: (_, index) {
            return PetItemWidget.name(list.elementAt(index), this);
          },
        ));
  }

  @override
  void onAdpotClick(AdoptInfo adoptInfo) {}

  @override
  void onCommentClick(AdoptInfo adoptInfo) {}

  @override
  void onCollectClick(AdoptInfo adoptInfo) {}

  @override
  void onShareClick(AdoptInfo adoptInfo) {}

  @override
  void onPetPhotoClick(String url) {}

  @override
  void onCancelCollectClick(AdoptInfo adoptInfo) {}
}

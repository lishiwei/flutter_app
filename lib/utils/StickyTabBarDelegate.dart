import 'package:flutter/material.dart';
import 'package:flutter_app/page/select_page.dart';

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Row(
          children: [
            Expanded(child: this.child),
            VerticalDivider(
              width: 1,
              color: Colors.white,
            ),
            Padding(padding: EdgeInsets.all(10)),
            InkWell(child: Image(
              image: AssetImage(
                "images/icon_loudou.png",
              ),
              height: 20,
              width: 20,
            ) ,onTap: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (buildContext)
            {
            return SelectPetPage();
            }))

            },)
           ,
            Padding(padding: EdgeInsets.all(10)),

          ],
        ));
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

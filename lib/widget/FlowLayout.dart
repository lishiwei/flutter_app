import 'package:flutter/material.dart';
GlobalKey<_FlowLayoutState> childKey = GlobalKey();
GlobalKey<_FlowLayoutState> childKey1 = GlobalKey();
GlobalKey<_FlowLayoutState> childKey2 = GlobalKey();
GlobalKey<_FlowLayoutState> childKey3 = GlobalKey();

class FlowLayout extends StatefulWidget {
  final List<String> list; //数据源
  final Color unSelectedColor; //初始背景色
  final Color selectColor; //选中时背景色
  Function(int) listener;
  final Color unSelectedBorderSlideColor; //未选中时边框色值
  final Color selectedBorderSlideColor; //选中时边框色值
  final int maxSelectSize; //最多选择的个数
  final double borderRadius; //边框圆角
  final double textSize; //字体大小
  final Color selectedTextColor; //选中时字体色值
  final Color unSelectTextColor; //未选中时字体色值
  final double marge; //间距
  final int initSelectIndex;

  FlowLayout(
      {@required this.list,
      this.unSelectedColor,
      this.selectColor,
      this.unSelectedBorderSlideColor,
      this.selectedBorderSlideColor,
      this.maxSelectSize,
      this.borderRadius,
      this.textSize,
      this.selectedTextColor,
      this.unSelectTextColor,
      this.marge,
      this.listener,
      Key key1,
      this.initSelectIndex}):super(key: key1);



  @override
  _FlowLayoutState createState() => _FlowLayoutState(
      list: list,
      unSelectedColor: unSelectedColor,
      selectColor: selectColor,
      unSelectedBorderSlideColor: unSelectedBorderSlideColor,
      selectedBorderSlideColor: selectedBorderSlideColor,
      maxSelectSize: maxSelectSize,
      borderRadius: borderRadius,
      listener: listener,
      initSelectIndex: initSelectIndex);
}

 class _FlowLayoutState extends State<FlowLayout> {
  List<String> list;
  Color unSelectedColor;
  Color selectColor;
  Color unSelectedBorderSlideColor;
  Color selectedBorderSlideColor;
  int maxSelectSize;
  double borderRadius;
  double textSize;
  Color selectedTextColor;
  Color unSelectTextColor;
  double marge;

  Function(int) listener;
  String selectList = "";
  int selectIndexList = -1;
  final int initSelectIndex;
Function() resetSelect;
  @override
  void initState() {
    print("FlowLayout initState");

    super.initState();

    selectList = (list.elementAt(initSelectIndex));
    selectIndexList = (initSelectIndex);
  }

  _FlowLayoutState(
      {@required this.list,
      this.unSelectedColor,
      this.selectColor,
      this.unSelectedBorderSlideColor,
      this.selectedBorderSlideColor,
      this.maxSelectSize,
      this.borderRadius,
      this.textSize,
      this.selectedTextColor,
      this.unSelectTextColor,
      this.marge,
      this.listener,
      this.initSelectIndex});

  @override
  Widget build(BuildContext context) {
    print("FlowLayout BuildContext");

    return Wrap(
      direction: Axis.horizontal, //主轴的方向
      spacing: marge ?? 5, // 主轴方向的间距
      children: _buildListWidget(list, maxSelectSize),
    );
  }

  List<Widget> _buildListWidget(List<String> list, int maxSize) {
    var listWidget = List<Widget>();
    for (var i = 0; i < list.length; i++) {
      if (selectIndexList == -1) {
        listWidget.add(_buildSingleText(list[i], i, false, maxSize));
      } else {
        if (selectIndexList == i) {
          listWidget.add(_buildSingleText(list[i], i, true, maxSize));
        } else {
          listWidget.add(_buildSingleText(list[i], i, false, maxSize));
        }
      }
    }

    return listWidget;
  }

  Widget _buildSingleText(String item, int index, bool select, int maxSize) {
    var text;
    if (select) {
      text = _buildSpecialWidget(item);
    } else {
      text = _buildNormalWidget(item);
    }

    return GestureDetector(
      child: text,
      onTap: () {

        if (selectIndexList == -1) {
          setSelectData(index, select);
        } else if (selectIndexList != (index)) {
          setSelectData(index, select);
        } else {
          setSelectData(-1, select);
        }
      },
    );
  }

  setSelectData(int index, bool select) {
    setState(() {
      selectIndexList = index;
      listener.call(index);
    });
  }

  /*点击时widget*/
  Widget _buildSpecialWidget(String desc) {
    return Chip(
      label: Text(
        desc,
        style: TextStyle(
            color: selectedTextColor ?? Color(0xff343a40),
            fontSize: textSize ?? 14),
      ),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          side: BorderSide(
              color: selectedBorderSlideColor ?? Colors.black, width: 1)),
    );
  }

/*未点击时widget*/
  Widget _buildNormalWidget(String desc) {
    return Chip(
      label: Text(desc,
          style: TextStyle(
              color: selectedTextColor ?? Color(0xff343a40),
              fontSize: textSize ?? 14)),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          side: BorderSide(
              color: unSelectedBorderSlideColor ?? Colors.grey[300], width: 1)),
    );
  }
}



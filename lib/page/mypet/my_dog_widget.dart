import 'package:flutter/material.dart';
import 'package:flutter_app/page/adopteesgardiantab/alladopteeswidget.dart';

class MyDogWidget extends StatefulWidget {
  MyDogWidget({Key key}) : super(key: key);

  @override
  _MyDogWidgetState createState() => _MyDogWidgetState();
}

class _MyDogWidgetState extends State<MyDogWidget> {

  List<Employee> list = [
    Employee.name(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        "我是主子名",
        "1岁6个月",
        "喵"),
    Employee.name(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        "我是主子名",
        "1岁6个月",
        "喵"),
    Employee.name(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        "我是主子名",
        "1岁6个月",
        "喵"),
  ];

  Widget getItem(Employee employee) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            child: Image(
              image: NetworkImage(
                  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg"),
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
                            style:
                            TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent, shape: BoxShape.circle))
                ],
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage("images/icon_arrow_women.png"),
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
          Image(
            image: AssetImage("images/icon_next_gray.png"),
            height: 20,
            width: 20,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey[300],
      child:ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return Divider(
            height: 0.5,
            color: Colors.grey[300],
            thickness: 0.5,
          );
        },
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (_, index) {
          return getItem(list[index]);
        },
      ),
    );
  }
}
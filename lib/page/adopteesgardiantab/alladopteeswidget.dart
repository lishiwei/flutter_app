import 'package:flutter/material.dart';
import 'package:flutter_app/page/my_apply.dart';

class Alladoptees extends StatefulWidget {
  Alladoptees({Key key}) : super(key: key);

  @override
  _AlladopteesState createState() => _AlladopteesState();
}

class _AlladopteesState extends State<Alladoptees> {
  List<Employee> list = [
    Employee(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        "我是主子名",
        "1岁6个月",
        "喵",
        "待领养",
        "已有10人申请",
        "8"),
    Employee(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        "我是主子名",
        "1岁6个月",
        "喵",
        "待领养",
        "已有10人申请",
        "9"),
    Employee(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        "我是主子名",
        "1岁6个月",
        "喵",
        "待领养",
        "已有10人申请",
        "8"),Employee(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        "我是主子名",
        "1岁6个月",
        "喵",
        "待领养",
        "已有10人申请",
        "8"),Employee(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242930882,2688076383&fm=11&gp=0.jpg",
        "我是主子名",
        "1岁6个月",
        "喵",
        "待领养",
        "已有10人申请",
        "8"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Column(
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
          Expanded(
            child: ListView.separated(
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
                return getItem(list[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget getItem(Employee employee) {
    return Container(
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
          Padding(padding: EdgeInsets.all(2)),
          Row(
            children: [
              Text(
                employee.employeeAmount,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Expanded(child: Text("")),
              Stack(
                children: [
                  InkWell(child: Container(
                      width: 120,
                      margin: EdgeInsets.only(top: 12),
                      height: 40,
                      child: Center(
                        child: Text("待处理申请",
                            style:
                            TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (buildContext) {
                        return MyApply();
                      }));
                    },),

                  Positioned(
                    child: Container(
                        child: Center(
                          child: Text(employee.unHandlerEmployeeAmount,
                              style:
                              TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle)),
                    left: 100,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Employee {
  String name;
  String photo;
  String age;
  String variety;
  String state;
  String employeeAmount;
  String unHandlerEmployeeAmount;

  Employee(this.photo, this.name, this.age, this.variety, this.state,
      this.employeeAmount,
      this.unHandlerEmployeeAmount);

  Employee.name(this.photo, this.name, this.age, this.variety);
}

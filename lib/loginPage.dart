import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: inpuChanged,
            decoration: InputDecoration(helperText: "请输入您的姓名"),
          ),
          TextField(
            onChanged: inpuChanged,
            decoration: InputDecoration(helperText: "请输入您的密码"),
          ),
          RaisedButton(
            child: Text("登陆"),
            onPressed: login,
          ),
        ],
      ),
    );
  }

  void inpuChanged(String value) {
    Fluttertoast.showToast(msg: value);
  }

 void login()  async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", true);
    Navigator.push(buildContext, MaterialPageRoute(builder: (buildContext)
    {
      return MyHomePage();
    }));
  }
}

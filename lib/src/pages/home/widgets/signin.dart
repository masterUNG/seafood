import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/models/user_model.dart';
import 'package:seafood_app/src/pages/home/states/my_service_buyer.dart';
import 'package:seafood_app/src/pages/home/states/my_service_rider.dart';
import 'package:seafood_app/src/pages/home/states/my_service_shopper.dart';
import 'package:seafood_app/src/pages/home/utility/my_constant.dart';
import 'package:seafood_app/src/pages/home/utility/my_style.dart';
import 'package:seafood_app/src/pages/home/utility/normal_dialog.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyStyle().showLogo(),
              MyStyle().mySizebox(),
              MyStyle().showTitle('Seafood'),
              MyStyle().mySizebox(),
              userForm(),
              MyStyle().mySizebox(),
              passwordForm(),
              MyStyle().mySizebox(),
              loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> checkAuthen() async {
    String path =
        '${MyConstant().domain}/seafood/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(path).then((value) {
      if (value.toString() == 'null') {
        normalDialog(context, 'No $user in my Database');
      } else {
        for (var item in json.decode(value.data)) {
          UserModel model = UserModel.fromJson(item);
          if (password == model.password) {
            switch (model.chooseType) {
              case 'buyer':
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyServiceBuyer(),
                    ),
                    (route) => false);
                break;
                 case 'shopper':
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyServiceShopper(userModel: model,),
                    ),
                    (route) => false);
                break;
                 case 'rider':
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyServiceRider(),
                    ),
                    (route) => false);
                break;
            }
          } else {
            normalDialog(context, 'Password False ?');
          }
        }
      }
    });
  }

  Widget loginButton() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().darkColor,
          onPressed: () {
            if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
              normalDialog(context, 'Have Space ?');
            } else {
              checkAuthen();
            }
          },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'User :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Password :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );

  Text showTitle() => Text('Seafood');

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}

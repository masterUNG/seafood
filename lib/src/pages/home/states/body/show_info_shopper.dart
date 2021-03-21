import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/models/user_model.dart';
import 'package:seafood_app/src/pages/home/utility/my_constant.dart';
import 'package:seafood_app/src/pages/home/utility/my_style.dart';
import 'package:seafood_app/src/pages/home/widgets/add_informaion.dart';

class ShowInfoShopper extends StatefulWidget {
  final UserModel userModel;
  ShowInfoShopper({@required this.userModel});
  @override
  _ShowInfoShopperState createState() => _ShowInfoShopperState();
}

class _ShowInfoShopperState extends State<ShowInfoShopper> {
  UserModel userModel;
  bool load = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    readUser();
  }

  Future<Null> readUser() async {
    String path =
        '${MyConstant().domain}/seafood/getUserWhereUser.php?isAdd=true&user=${userModel.user}';
    await Dio().get(path).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          load = false;
          userModel = UserModel.fromJson(item);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddInformaion(userModel: userModel,),
              )).then((value) => readUser()),
          child: Text('Edit')),
      body: Center(
        child: Column(
          children: [
            buildImage(),
            Text(userModel.name),
            buildMap(),
          ],
        ),
      ),
    );
  }

  Expanded buildMap() => Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: load
              ? MyStyle().showProgress()
              : userModel.lat.isEmpty
                  ? Center(child: Text('No Lat, Lng'))
                  : Text('Have Data'),
        ),
      );

  Container buildImage() {
    return Container(
      width: 250,
      height: 250,
      child: Image(
        image: AssetImage('assets/images/image.png'),
      ),
    );
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/models/product_model.dart';
import 'package:seafood_app/src/pages/home/states/app_product_shopper.dart';
import 'package:seafood_app/src/pages/home/utility/my_constant.dart';
import 'package:seafood_app/src/pages/home/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowProductShopper extends StatefulWidget {
  @override
  _ShowProductShopperState createState() => _ShowProductShopperState();
}

class _ShowProductShopperState extends State<ShowProductShopper> {
  List<ProductModel> productModels = [];
  bool statusLoad = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readProduct();
  }

  Future<Null> readProduct() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String idshop = preferences.getString('id');
    String apiProduct =
        '${MyConstant().domain}/seafood/getProductWhereIdShopper.php?isAdd=true&idshop=$idshop';
    await Dio().get(apiProduct).then((value) {
      setState(() {
        statusLoad = false;
      });

      if (value.toString() != 'null') {
        for (var item in json.decode(value.data)) {
          ProductModel model = ProductModel.fromMap(item);
          setState(() {
            productModels.add(model);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductShopper(),
            )).then((value) => readProduct()),
        child: Text('Add'),
      ),
      body: statusLoad
          ? MyStyle().showProgress()
          : productModels.length == 0
              ? Center(child: Text('No Product'))
              : Text('Have Data'),
    );
  }
}

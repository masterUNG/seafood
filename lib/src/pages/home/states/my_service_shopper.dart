import 'package:flutter/material.dart';
import 'package:seafood_app/models/user_model.dart';
import 'package:seafood_app/src/pages/home/states/body/show_info_shopper.dart';
import 'package:seafood_app/src/pages/home/states/body/show_order_shopper.dart';
import 'package:seafood_app/src/pages/home/states/body/show_product_shopper.dart';

class MyServiceShopper extends StatefulWidget {
  final UserModel userModel;
  MyServiceShopper({@required this.userModel});
  @override
  _MyServiceShopperState createState() => _MyServiceShopperState();
}

class _MyServiceShopperState extends State<MyServiceShopper> {
  Widget current = ShowOrderShopper();
  UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Shopper'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            buildUserAccountsDrawerHeader(),
            buildMenuShowOrder(),
            buildMenuShowInfo(),
            buildMenuShowProdoct(),
          ],
        ),
      ),
      body: current,
    );
  }

  ListTile buildMenuShowOrder() {
    return ListTile(
      leading: Icon(Icons.filter_1),
      title: Text('Show Order'),
      onTap: () {
        setState(() {
          current = ShowOrderShopper();
          Navigator.pop(context);
        });
      },
    );
  }

  ListTile buildMenuShowInfo() {
    return ListTile(
      leading: Icon(Icons.filter_2),
      title: Text('Show Informaion'),
      onTap: () {
        setState(() {
          current = ShowInfoShopper(userModel: userModel,);
          Navigator.pop(context);
        });
      },
    );
  }

  ListTile buildMenuShowProdoct() {
    return ListTile(
      leading: Icon(Icons.filter_3),
      title: Text('Show Product'),
      onTap: () {
        setState(() {
          current = ShowProductShopper();
          Navigator.pop(context);
        });
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
        accountName: Text('Name'), accountEmail: Text('Shopper'));
  }
}

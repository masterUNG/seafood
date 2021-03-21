import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/widgets/cr_page.dart';
import 'package:seafood_app/src/pages/home/widgets/fi_page.dart';
import 'package:seafood_app/src/pages/home/widgets/header.dart';
import 'package:seafood_app/src/pages/home/widgets/sf_page.dart';
import 'package:seafood_app/src/pages/home/widgets/sh_page.dart';
import 'package:seafood_app/src/pages/home/widgets/signin.dart';
import 'package:seafood_app/src/pages/home/widgets/signup.dart';
import 'package:seafood_app/src/pages/home/widgets/sq_page.dart';
import 'package:seafood_app/src/pages/home/widgets/cv_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('')),
      ),
      drawer: showDrawer(),
      backgroundColor: Colors.blueGrey,
      body: Stack(children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 100, 50, 50),
            child: Column(
              children: [
                Image.asset('assets/images/SH.png'),
                RaisedButton(
                    onPressed: () => doSH(),
                    color: Colors.greenAccent,
                    child: Text('กุ้ง',
                        style: TextStyle(
                          fontSize: 25.0,
                        ))),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset('assets/images/SF.png'),
                RaisedButton(
                    onPressed: () => doSF(),
                    color: Colors.greenAccent,
                    child: Text('หอย',
                        style: TextStyle(
                          fontSize: 25.0,
                        ))),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset('assets/images/CR.png'),
                RaisedButton(
                    onPressed: () => doCR(),
                    color: Colors.greenAccent,
                    child: Text('ปู',
                        style: TextStyle(
                          fontSize: 25.0,
                        ))),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset('assets/images/FI.png'),
                RaisedButton(
                    onPressed: () => doFI(),
                    color: Colors.greenAccent,
                    child: Text('ปลา',
                        style: TextStyle(
                          fontSize: 25.0,
                        ))),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset('assets/images/SQ.png'),
                RaisedButton(
                    onPressed: () => doSQ(),
                    color: Colors.greenAccent,
                    child: Text('ปลาหมึก',
                        style: TextStyle(
                          fontSize: 25.0,
                        ))),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    BackButton(
                      onPressed: () => dologin(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Header(_scrollController),
      ]),
    );
  }

  doSH() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ShPage()));
  }

  doSF() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SfPage()));
  }

  doCR() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => CrPage()));
  }

  doFI() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => FiPage()));
  }

  doSQ() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SqPage()));
  }

  doMain() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Drawer showDrawer() => Drawer(
    child: ListView(
      children: [
        showHeadDrawer(),
        signInMenu(),
        signUpMenu(),
      ],
    ),
  );

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
        accountName: Text('Guest'), accountEmail: Text('Please Login'));
  }

  ListTile signInMenu() => ListTile(
    leading: Icon(Icons.android),
    title: Text('Sign In'),
    onTap: () {
      Navigator.pop(context);
      MaterialPageRoute route =
      MaterialPageRoute(builder: (value) => SignIn());
      Navigator.push(context, route);
    },
  );

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign Up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
        MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }


  dologin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> LoginPage ()));
  }
}



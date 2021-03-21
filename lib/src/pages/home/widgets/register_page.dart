import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/widgets/str_page.dart';
import 'package:seafood_app/src/pages/home/widgets/ur_page.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg_login.jpg")),
          ),
        ),

        Center(
          child: Padding(
           padding: const EdgeInsets.fromLTRB(0, 200, 0, 200),
            child: Column(
              children: [
                RaisedButton(
                  onPressed: () => doUr(),
                  color: Colors.orange,
                  child: Text(
                    'ลงทะเบียนผู้ใช้งาน',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                RaisedButton(
                  onPressed: () => doStr(),
                  color: Colors.pink,
                  child: Text(
                    'ลงทะเบียนร้านค้า',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
          ),
        ),
      ]),
    );
  }

  doUr() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => UrPage()));
  }

  doStr() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => StrPage()));
  }
}

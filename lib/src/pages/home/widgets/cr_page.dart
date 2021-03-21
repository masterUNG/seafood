import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/home_page.dart';

class CrPage extends StatefulWidget {
  @override
  _CrPageState createState() => _CrPageState();
}

class _CrPageState extends State<CrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('แอพสั่งอาหารทะเลสดพร้อมส่ง')),),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white12,
          ),
          ListView(
            children: [
              Center(
                child: Text('รายละเอียดปู',
                  style:TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Image.asset('assets/images/CR1.png'),
              Center(
                child: Text('ปูม้า',
                  style:TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดเล็ก 250 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดกลาง 300 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดใหญ่ 380 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Image.asset('assets/images/CR.png'),
              Center(
                child: Text('ปูดำ',
                  style:TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดเล็ก 180 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดกลาง 300 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดใหญ่ 400 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  BackButton(
                    onPressed: () => doCR(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  doCR() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> HomePage ()));
  }

  doSHOP() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> HomePage ()));
  }
}

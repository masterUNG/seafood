import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/home_page.dart';

class SqPage extends StatefulWidget {
  @override
  _SqPageState createState() => _SqPageState();
}

class _SqPageState extends State<SqPage> {
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
                child: Text('รายละเอียดปลาหมึก',
                  style:TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Image.asset('assets/images/SQ.png'),
              Center(
                child: Text('ปลาหมึก',
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
                child: Text('ขนาดกลาง 350 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดใหญ่ 450 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Image.asset('assets/images/SQ1.png'),
              Center(
                child: Text('ปลาหมึกไข่',
                  style:TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดเล็ก 200 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดกลาง 220 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => doSHOP(),
                child: Text('ขนาดใหญ่ 250 บาท',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  BackButton(
                    onPressed: () => doSQ(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  doSQ() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> HomePage ()));
  }

  doSHOP() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> HomePage ()));
  }
}

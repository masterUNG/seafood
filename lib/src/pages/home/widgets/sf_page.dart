import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/home_page.dart';

class SfPage extends StatefulWidget {
  @override
  _SfPageState createState() => _SfPageState();
}

class _SfPageState extends State<SfPage> {
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
          Padding(
            padding: const EdgeInsets.fromLTRB(30,0,30,0),
            child: ListView(
              children: [
                Center(
                  child: Text('รายละเอียดหอย',
                    style:TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20,),

                Image.asset('assets/images/SF1.png'),
                RaisedButton(
                    onPressed: () => doSF(),
                    color:Colors.greenAccent,
                    child: Text('หอยลาย - กิโลละ 80 บาท',style:TextStyle(fontSize:20.0, ))),
                SizedBox(height: 20,),
                Image.asset('assets/images/SF2.png'),
                RaisedButton(
                    onPressed: () => doSF(),
                    color:Colors.greenAccent,
                    child: Text('หอยนางรม - กิโลละ 200 บาท',style:TextStyle(fontSize:20.0, ))),
                Image.asset('assets/images/SF3.png'),
                RaisedButton(
                    onPressed: () => doSF(),
                    color:Colors.greenAccent,
                    child: Text('หอยแครง - กิโลละ 160 บาท',style:TextStyle(fontSize:20.0, ))),
                Image.asset('assets/images/SF4.png'),
                RaisedButton(
                    onPressed: () => doSF(),
                    color:Colors.greenAccent,
                    child: Text('หอยแมลงภู่ - กิโลละ 70 บาท',style:TextStyle(fontSize:20.0, ))),
                Row(
                  children: [
                    BackButton(
                      onPressed: () => doSF(),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  doSF() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> HomePage ()));
  }
  }


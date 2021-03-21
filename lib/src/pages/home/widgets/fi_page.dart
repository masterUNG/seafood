import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/home_page.dart';

class FiPage extends StatefulWidget {
  @override
  _FiPageState createState() => _FiPageState();
}

class _FiPageState extends State<FiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('แอพสั่งอาหารทะเลสดพร้อมส่ง',)),),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white12,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50,0,50,0),
            child: ListView(
              children: [
                Center(
                  child: Text('รายละเอียดปลา',
                    style:TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Image.asset('assets/images/FI1.png'),
                RaisedButton(
                    onPressed: () => doFI(),
                    color:Colors.greenAccent,
                    child: Text('ปลากะพง - กิโลละ 150 บาท',style:TextStyle(fontSize:20.0, ))),
                SizedBox(height: 20,),

                Image.asset('assets/images/FI.png'),
                RaisedButton(
                    onPressed: () => doFI(),
                    color:Colors.greenAccent,
                    child: Text('ปลาทู - กิโลละ 130 บาท',style:TextStyle(fontSize:20.0, ))),
                SizedBox(height: 20,),

                Image.asset('assets/images/FI3.png'),
                RaisedButton(
                    onPressed: () => doFI(),
                    color:Colors.greenAccent,
                    child: Text('ปลาซาบะ - กิโลละ 80 - 90 บาท',style:TextStyle(fontSize:20.0, ))),
                SizedBox(height: 20,),

                Image.asset('assets/images/FI4.png'),
                RaisedButton(
                    onPressed: () => doFI(),
                    color:Colors.greenAccent,
                    child: Text('ปลาโอ - กิโลละ 80-100 บาท',style:TextStyle(fontSize:20.0, ))),
                SizedBox(height: 20,),

                Image.asset('assets/images/FI5.png'),
                RaisedButton(
                    onPressed: () => doFI(),
                    color:Colors.greenAccent,
                    child: Text('ปลาอินทรี - กิโลละ 400 บาท',style:TextStyle(fontSize:20.0, ))),
                SizedBox(height: 20,),
                Row(
                  children: [
                    BackButton(
                      onPressed: () => doFI(),
                    ),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

  doFI() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> HomePage ()));
  }
}
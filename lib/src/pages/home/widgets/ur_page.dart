import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/home_page.dart';

class UrPage extends StatefulWidget {
  @override
  _UrPageState createState() => _UrPageState();
}

class _UrPageState extends State<UrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('แอพสั่งอาหารทะเลสดพร้อมส่ง')),),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.lightBlueAccent,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,10,0),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text('ลงทะเบียนผู้ใช้งาน',
                    style:TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 40,),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_box_outlined),
                      labelText: 'username',
                      labelStyle:
                      TextStyle(color: Colors.black,fontSize: 20.0),
                      filled: true,
                      fillColor: Colors.white70,
                      border: InputBorder.none),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      labelText: 'password',
                      labelStyle:
                      TextStyle(color: Colors.black,fontSize: 20.0),
                      filled: true,
                      fillColor: Colors.white70,
                      border: InputBorder.none),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelStyle:
                      TextStyle(color: Colors.black,fontSize: 20.0),
                      labelText: 'tel',
                      filled: true,
                      fillColor: Colors.white70,
                      border: InputBorder.none),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.home_outlined),
                      labelText: 'address',
                      labelStyle:
                      TextStyle(color: Colors.black,fontSize: 20.0),
                      filled: true,
                      fillColor: Colors.white70,
                      border: InputBorder.none),
                ),
                SizedBox(height: 25,),
                RaisedButton(
                    onPressed: () => doOK(),
                    color:Colors.greenAccent,
                    child: Text('OK',style:TextStyle(fontSize:20.0, )))
              ],
            ),
          ),
        ],
      ),
    );
  }

  doOK() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> HomePage ()));
  }
}

import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/home_page.dart';
class StrPage extends StatefulWidget {
  @override
  _StrPageState createState() => _StrPageState();
}

class _StrPageState extends State<StrPage> {
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
                  child: Text('ลงทะเบียนร้านค้า',
                    style:TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20,),
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
                      labelText: 'tel',
                      labelStyle:
                      TextStyle(color: Colors.black,fontSize: 20.0),
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
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      labelText: 'store',
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
          )
        ],
      ),
    );
  }

  doOK() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> HomePage ()));
  }
}

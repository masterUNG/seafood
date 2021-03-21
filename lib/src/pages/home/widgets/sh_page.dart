import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/home_page.dart';



class ShPage extends StatefulWidget {
  @override
  _ShPageState createState() => _ShPageState();
}

class _ShPageState extends State<ShPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('แอพสั่งอาหารทะเลสดพร้อมส่ง')),),
      drawer: Drawer(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Center(
                  child: Text('รายละเอียดกุ้ง',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Image.asset('assets/images/SH1.png'),
              Center(
                child: Text('กุ้งกุลาดำ',
                  style: TextStyle(
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
              Image.asset('assets/images/SH2.png'),
              Center(
                child: Text('กุ้งขาว',
                  style: TextStyle(
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
              Image.asset('assets/images/SH.png'),
              Center(
                child: Text('กุ้งแม่น้ำ',
                  style: TextStyle(
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
                    onPressed: () => doSH(),
                  ),
                ],
              ),
              _buildIconButton(
                onPressed: () => print("click!!"),
                icon: Icons.shopping_cart,
                notification: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }



  doSH() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=> HomePage ()));
  }


  doSHOP() {

  }

  _buildIconButton({void Function() onPressed, IconData icon, int notification}) {}



}

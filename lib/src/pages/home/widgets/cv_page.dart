import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/widgets/signin.dart';
import 'package:seafood_app/src/pages/home/widgets/signup.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('')),
        ),
        drawer: showDrawer(),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/home.jpg'))),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: Form(
                key: _formkey,
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
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



  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
        accountName: Text('Guest'), accountEmail: Text('Please Login'));
  }
}

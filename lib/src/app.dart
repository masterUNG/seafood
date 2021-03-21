import 'package:flutter/material.dart';
import 'package:seafood_app/src/pages/home/home_page.dart';
import 'package:seafood_app/src/pages/home/widgets/cv_page.dart';



class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}


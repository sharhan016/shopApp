import 'package:flutter/material.dart';

import './pages/homepage.dart';
import './pages/secondpage.dart';
import './widgets/gridview/gridviewnew.dart';
import './pages/login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //canvasColor: Color(0xffEBF1E4),
        canvasColor: Colors.white12,
        //canvasColor: Colors.white,
        //backgroundColor: Colors.white12,
        //primarySwatch: Colors.green,
      ),
      home: HomePage(title: 'Shopping Application'),
      //home: SecondPage(),
      //home: LoginPage(),
    );
  }
}

// ctrl + alt + l
import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/gridview/gridviewnew.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../widgets/horizontallist/services.dart';
import '../widgets/horizontallist/model.dart';


class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var simages = [];
  List data;
  Services _services;
  final String url = "http://olive.mystoreapp.in/api/slideimage";


  Future<List> getImages() async {
    var res = await http.get(Uri.encodeFull(url),headers: {"Accept":"application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["image"];
      print(data);

    });
    return data;
  }

  @override
  void initState() {
    super.initState();


  }

  Widget image_carousel = Container(
    height: 200.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [],
    ),
  );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Olive Hyper Market Second Page"),
      ),
      body: GridViewNew(),

    );
  }
}

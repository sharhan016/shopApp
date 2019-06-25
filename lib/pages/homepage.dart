import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './variables.dart';
import 'package:olive_hyper/widgets/horizontallist/horizontal_list.dart';
import 'package:olive_hyper/widgets/recent/products.dart';
import '../widgets/gridview/gridviewnew.dart';
import '../widgets/slideimage.dart';


class HomePage extends StatefulWidget {
   
   
   HomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String url = "http://olive.mystoreapp.in/api/slideimage";


  List data = new List();
  List<ImageProvider> list = new List();
  //List<String> list = new List();
  Future getImages() async {
    var res = await http.get(Uri.encodeFull(url),headers: {"Accept":"application/json"});
    setState(() {
        data = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    super.initState();
    this.getImages();

  }
  List<ImageProvider>getSlides(){

    for(var i=0;i < data.length; i++) {
      list.add(new NetworkImage('$iurl'+data[i]['image']));
    }
    return list;
  }

//  List<String>getSlides(){
//    for(var i=0;i<data.length;i++){
//      list.add('$iurl'+data[i]['image']); }
//
//    return list;
//  }

  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: getSlides(),
        //images: FadeInImage.assetNetwork(placeholder: 'images/loader.png', image: getSlides()),
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 2.0,
        dotColor: Colors.white70,
      )
    );


    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Color(0xff0A900A),
        //leading: IconButton(icon: Ico, onPressed: null),
        title: Text('Olive hyper market'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),


      body: new Container(
        decoration: new BoxDecoration(
          //color: Color(#D8E7C4);
        ),
        child: new ListView(
          children: <Widget>[
            image_carousel,
            
          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Categories',style: TextStyle(fontSize: 16.0,color: Colors.white)),),

            HorizontalList(),

            new Padding(padding: const EdgeInsets.all(8.0),
              child: new Text('Recent Products',style: TextStyle(fontSize: 16.0,color: Colors.white)),),

            Products(),
          ],
        ),
      ),
    );
  
}
}


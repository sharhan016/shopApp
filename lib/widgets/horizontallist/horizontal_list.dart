import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../../pages/variables.dart';
import '../gridview/gridviewnew.dart';


class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  final String categoryUrl = "http://olive.mystoreapp.in/api/category";

  List categoryData = new List();
  List<String> list2 = new List();
  List<String> cName = new List();
  bool _isLoading = false;

  @override
  void initState(){
    super.initState();
    this.getCategories();
  }

  Future getCategories() async {
    var resBody = await http.get(Uri.encodeFull(categoryUrl),headers: {"Accept":"application/json"});
    setState(() {
      categoryData = jsonDecode(resBody.body);
      this.getImg();
      this.getCategoryName();
    });
  }

//  List<ImageProvider> getImg(){
//
//    for(var i=0;i < categoryData.length; i++) {
//      print('$iurl'+categoryData[i]['image']);
//      list2.add(new NetworkImage('$iurl'+categoryData[i]['image']));
//    }
//    return list2;
//  }

  List<String> getImg(){
    for(var i=0;i < categoryData.length; i++) {
      //print('$iurl'+categoryData[i]['image']);
      list2.add('$iurl'+categoryData[i]['image']); }
    return list2;
  }
  List<String> getCategoryName(){
    for(var i=0; i<categoryData.length; i++){
      cName.add(categoryData[i]['name']);}
    return cName;
  }

  Widget _buildProductItem(BuildContext context, int index) {
    print(list2);
    print(cName);
    return Card(
      color: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: (){
          // ============= Category Handling Here =================//
          //print('tapped');
          Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewNew()));
        },
        child: Container(
//        width: 150.0,
//        height: 120.0,
          child: Column(
            children: <Widget>[
              Expanded(
              //child: Image.network(list2[index]),
              child: FadeInImage.assetNetwork(placeholder: 'images/loader.png', image: list2[index])
              ),

          Text(cName[index]),
              //Image.asset('assets/macbook.jpg'),
              //Text(products[index], style: TextStyle(color: Colors.deepPurple))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(list2);
    //print(getImg());
    return Container(
        height: 135.0,
            child: ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: list2.length,
            scrollDirection: Axis.horizontal,
            //children: getImg().map( (provider)=> Category(image_location: provider) ).toList(),
          ),

    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location,this.image_caption});

  @override
  Widget build(BuildContext context) {
    print("inside Category");
    print(image_location);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          //width: 150.0,
          child: ListTile(
            title: FadeInImage.assetNetwork(placeholder: 'images/loader.png', image: image_location,fit: BoxFit.contain,),
            //subtitle: new Text(image_caption),
          ),
        ),
      ),
    );
  }
}


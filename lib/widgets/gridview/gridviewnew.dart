import 'package:flutter/material.dart';
import 'services.dart';
import 'album.dart';
import 'gridcell.dart';

class GridViewNew extends StatefulWidget {
  GridViewNew() : super();

  final String title = "Category";
  
  @override
  _GridViewNewState createState() => _GridViewNewState();

  static count({int crossAxisCount, double childAspectRatio, double mainAxisSpacing, double crossAxisSpacing, List<GridTile> children}) {}
  }
  
  class _GridViewNewState extends State<GridViewNew> {
  
    gridview(AsyncSnapshot<List<Album>> snapshot){
      return Padding(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map(
          (album){
            return GridTile(
            child: Albumcell(album),);
          },
        ).toList(),
      ),
    );
  }

  circularProgress(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FutureBuilder<List<Album>>(
              future: Services.getCategory(),
              builder: (context, snapshot){
                //
                if(snapshot.hasError){
                  return Text('Error ${snapshot.error}');
                }
                if(snapshot.hasData){
                  return gridview(snapshot);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
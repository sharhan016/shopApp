import 'package:flutter/material.dart';
import 'album.dart';
import '../../pages/variables.dart';

class Albumcell extends StatelessWidget{
  const Albumcell(this.album);
  @required
  final Album album;
   
  @override
  Widget build(BuildContext context){
        return Card(
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(5.0),
//          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: "images/loader.png",
                        image: '$iurl'+album.image,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  album.name,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}
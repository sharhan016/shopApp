import 'package:flutter/material.dart';

class SlideImage extends StatefulWidget {
  @override
  _SlideImageState createState() => _SlideImageState();
}

class _SlideImageState extends State<SlideImage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
            child:
              new GridView.extent(
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: const EdgeInsets.all(0.0),
                children: <Widget>[
                  
                ],
              ),
              
    
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
          );
    
      
    
  }
}
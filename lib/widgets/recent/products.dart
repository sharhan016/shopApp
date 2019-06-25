import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "id": 1,
      "name": "Combo Kid Jacket",
      "image": "images/c1.jpg",
      "old_price": "100",
      "new_price": "50"
    },
    {
      "id": 2,
      "name": "Second",
      "image": "images/c2.jpeg",
      "old_price": "120",
      "new_price": "70"
    },
    {
      "id": 3,
      "name": "Third",
      "image": "images/c6.jpeg",
      "old_price": "120",
      "new_price": "70"
    },
    {
      "id": 4,
      "name": "Second",
      "image": "images/c2.jpeg",
      "old_price": "120",
      "new_price": "70"
    },
    {
      "id": 5,
      "name": "Second",
      "image": "images/c2.jpeg",
      "old_price": "120",
      "new_price": "70"
    },
    {
      "id": 6,
      "name": "Second",
      "image": "images/c2.jpeg",
      "old_price": "120",
      "new_price": "70"
    },
    {
      "id": 2,
      "name": "Second",
      "image": "images/c2.jpeg",
      "old_price": "120",
      "new_price": "70"
    },
    {
      "id": 2,
      "name": "Second",
      "image": "images/c2.jpeg",
      "old_price": "120",
      "new_price": "70"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Single_product(
            prod_id: product_list[index]['id'],
            prod_name: product_list[index]['name'],
            prod_image: product_list[index]['image'],
            prod_new_price: product_list[index]['new_price'],
            prod_old_price: product_list[index]['old_price'],
          );
        });
  }
}

class Single_product extends StatelessWidget {
  final prod_id;
  final prod_name;
  final prod_image;
  final prod_old_price;
  final prod_new_price;

  Single_product(
      {this.prod_name,
        this.prod_id,
        this.prod_image,
        this.prod_old_price,
        this.prod_new_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                child: InkWell(
                  onTap: () {
                    print('tapped image');
                  },
                  child: Image.asset(
                    prod_image,
                    fit: BoxFit.fitHeight,
                  ),//image.asset
                ),//inkwell
                footer: InkWell(
                  onTap: () {
                    print('tapped 1');
                  },
                  child: Container(
                    height: 60.0,
                    color: Colors.white70,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                            child: Text(
                              prod_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          child: Text('\₹$prod_new_price',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        Container(
                          child: Text('\₹$prod_old_price',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                                fontWeight: FontWeight.w400,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
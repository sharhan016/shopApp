class Model{
  int id;
  String name;
  String image;

  Model({this.id,this.name,this.image});

  factory Model.fromJson(Map<String,dynamic>json){
    return Model(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

}
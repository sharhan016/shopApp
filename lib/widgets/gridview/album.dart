class Album{
  int id;
  String name;
  String image;

  Album({this.id,this.name,this.image});

  factory Album.fromJson(Map<String,dynamic>json){
    return Album(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
    );
  }

}
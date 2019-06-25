import 'dart:convert';
import 'package:http/http.dart' as http;
import 'album.dart';

class Services {
  static const String url = "http://olive.mystoreapp.in/api/category";

  static Future<List<Album>> getCategory() async {
    try {
      final response = await http.get(url);
      if(response.statusCode==200){
        List<Album> list = parseData(response.body);
        return list;
      }else{
        throw Exception("Error");
      }
    } catch(e){
      throw Exception(e.toString());
    }
  }

  static List<Album> parseData(String responseBody){
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      return parsed.map<Album>((json) =>Album.fromJson(json)).toList();
  }


}
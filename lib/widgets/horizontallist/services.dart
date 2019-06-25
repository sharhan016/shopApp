import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class Services {
  static const String url = "http://olive.mystoreapp.in/api/category";

  static Future<List<Model>> getCategory() async {
    try {
      final response = await http.get(url);
      if(response.statusCode==200){
        List<Model> list = parseData(response.body);
        return list;
      }else{
        throw Exception("Error");
      }
    } catch(e){
      throw Exception(e.toString());
    }
  }

  static List<Model> parseData(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Model>((json) =>Model.fromJson(json)).toList();
  }


}
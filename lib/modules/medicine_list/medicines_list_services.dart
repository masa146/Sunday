
import 'package:pharmacy_app/config/server_config.dart';
import 'package:http/http.dart ' as http;
import 'package:pharmacy_app/models/category.dart';
class MedicinesService {
  int id;
MedicinesService({required this.id});

   Uri geturl(){
     return  Uri.parse(ServerConfiguration.domainNameServer+ServerConfiguration.getMedicines(id));}

  Future<List<Category>> getCategories(String token) async{
    var response = await http.get(geturl(),headers: {
      "Accept": "application/json",
      "Authorization": 'Bearer $token'

    });


    if (response.statusCode==200) {
      var categories = categoriesFromJson(response.body);
      return categories.data;
    }
    else{
      return [];
    }
  }

}
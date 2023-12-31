
import 'package:pharmacy_app/config/server_config.dart';
import 'package:http/http.dart ' as http;
import 'package:pharmacy_app/models/category.dart';
class HomeService {

  var url=Uri.parse(ServerConfiguration.domainNameServer+ServerConfiguration.getCategories);
  Future<List<Category>> getCategories(String token) async{
var response = await http.get(url,headers: {
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
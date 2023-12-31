
import 'package:get/get.dart';
import 'package:pharmacy_app/config/user_information.dart';
import 'package:pharmacy_app/models/category.dart';
import 'package:pharmacy_app/modules/home/home_service.dart';

class HomeController extends GetxController{
   List<Category> categoriesList = [];
  HomeService service = HomeService();
  var isLoading = true.obs;
  @override
  void onInit(){
    super.onInit();
  }
  void onReady() async{
    categoriesList =  await service.getCategories(UserInformation.userToken);
    isLoading(false);
    super.onReady();
  }

}
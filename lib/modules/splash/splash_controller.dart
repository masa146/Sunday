import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/config/user_information.dart';
import 'package:pharmacy_app/native_service/secure_storage.dart';

class SplashController extends GetxController {
  late SecureStorage storage;

  @override
  void onInit() async {
    storage = SecureStorage();
    await checkToken();
    super.onInit();
  }

  Future<void>checkToken()async{
    String? token=await storage.read('token');
    Future.delayed(const Duration(seconds:3),() {
      if(token !=null){
       UserInformation.userToken = token;
        Get.offAllNamed('/home');
      }else{

        Get.offNamed('/login');
      }
    },);

  }
}

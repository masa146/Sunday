import 'package:get/get.dart';
import 'package:pharmacy_app/modules/logout/logout_service.dart';

import '../../native_service/secure_storage.dart';

class LogoutController extends GetxController{
  late SecureStorage storage;
  late LogoutService service;
  String? token;
  var message;
  var logoutStatus=false;
  @override
  void onInit() async{
    storage=SecureStorage();
    service=LogoutService();
    super.onInit();
  }

  Future<void>logoutOnClick()async {
    token=await storage.read('token');
    await storage.delete();
    logoutStatus=await service.logout(token);
    message=service.message;

  }
}
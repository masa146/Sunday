import 'package:get/get.dart';
import 'package:pharmacy_app/modules/login/login_controller.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
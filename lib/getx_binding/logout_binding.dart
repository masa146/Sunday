import 'package:get/get.dart';

import '../modules/logout/logout_controller.dart';


class LogoutBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LogoutController>(LogoutController());
  }

}
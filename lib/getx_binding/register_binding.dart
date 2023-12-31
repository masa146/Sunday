import 'package:get/get.dart';
import 'package:pharmacy_app/modules/register/register_controller.dart';

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
   Get.put<RegisterController>(RegisterController());
  }

}
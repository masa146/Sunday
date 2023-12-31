import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/getx_binding/home_binding.dart';
import 'package:pharmacy_app/getx_binding/login_binding.dart';
import 'package:pharmacy_app/getx_binding/logout_binding.dart';
import 'package:pharmacy_app/getx_binding/navbar_binding.dart';
import 'package:pharmacy_app/getx_binding/register_binding.dart';
import 'package:pharmacy_app/getx_binding/search_binding.dart';
import 'package:pharmacy_app/getx_binding/splash_binding.dart';
import 'package:pharmacy_app/modules/home/home_view.dart';
import 'package:pharmacy_app/modules/login/login_view.dart';
import 'package:pharmacy_app/modules/logout/logout_view.dart';
import 'package:pharmacy_app/modules/medicine_list/medicine_list_view.dart';
import 'package:pharmacy_app/modules/navbar/navbar_controller.dart';
import 'package:pharmacy_app/modules/navbar/navbar_view.dart';
import 'package:pharmacy_app/modules/register/register_view.dart';
import 'package:pharmacy_app/modules/splash/splash_view.dart';


import 'modules/search/sreach_view.dart';

void main() {
  runApp(
      ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return  GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/splash',
              getPages: [
                GetPage(name: '/splash', page: ()=>Splash(),binding:SplashBinding()),
                GetPage(name: '/login', page: ()=>Login(),binding: LoginBinding()),
                GetPage(name: '/register', page: ()=>Register(),binding: RegisterBinding()),
                GetPage(name: '/home', page: ()=>Home(),binding: HomeBindings()),
                GetPage(name: '/search', page: ()=>Search(),binding: SearchBinding()),
                GetPage(name: '/logout', page: ()=>Logout(),binding:LogoutBinding()),
                GetPage(name: '/medicineList', page: ()=>MedicinesList()),
              ],
              builder: EasyLoading.init(),
            );
          }),
  );
}
/*ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/home1',
            getPages: [
              GetPage(name: '/home', page: () => Home()),

            ],
          );
        }),*/
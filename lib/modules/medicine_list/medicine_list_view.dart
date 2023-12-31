
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/models/medicine.dart';
import 'package:pharmacy_app/modules/home/home_controller.dart';
import 'package:pharmacy_app/modules/medicine_card/medicine_card_details.dart';
import 'package:pharmacy_app/modules/medicine_details/medicine_details_view.dart';


class MedicinesList extends StatelessWidget {
  HomeController controller = Get.find();
  final List<Medicine> products = [
    Medicine(
        trade_name: "Allergy Relief",
        ScientificName: "Scientific",
        category: "category",
        company: "company",
        expirationDate: "20/10/2024",
        price: 50,
        image: "assets/images/Allergy Relief.jpg",
        quantity: 50),
    Medicine(
        trade_name: "Allergy Relief",
        ScientificName: "Scientific",
        category: "category",
        company: "company",
        expirationDate: "20/10/2024",
        price: 50,
        image: "assets/images/Allergy Relief.jpg",
        quantity: 150),
    Medicine(
        trade_name: "Dettol",
        ScientificName: "Scientific",
        category: "category",
        company: "company",
        expirationDate: "22/10/2024",
        price: 100,
        image: "assets/images/Dettol.jpg",
        quantity: 150),
    Medicine(
        trade_name: "Allergy Relief",
        ScientificName: "Scientific",
        category: "category",
        company: "company",
        expirationDate: "20/10/2024",
        price: 50,
        image: "assets/images/Allergy Relief.jpg",
        quantity: 50),
    Medicine(
        trade_name: "Dettol",
        ScientificName: "Scientific",
        category: "category",
        company: "company",
        expirationDate: "22/10/2024",
        price: 100,
        image: "assets/images/Dettol.jpg",
        quantity: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue[300],
            title: Text(
              "personal care",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, i) {
                return MedicineCard(
                  medicine: products[i],
                  onTap: () {
                    Get.to(MedicineDetails(productdetails: products[i]));
                  },
                );
              }),
        ),
      ),
    );
  }
}

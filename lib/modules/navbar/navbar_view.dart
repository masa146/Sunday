import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/modules/logout/logout_controller.dart';
import 'package:pharmacy_app/modules/logout/logout_view.dart';
import 'package:pharmacy_app/modules/navbar/navbar_controller.dart';

class NavBar extends StatelessWidget {
   NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(''),
            accountEmail: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/pharmacy.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: (){
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text('My Orders'),
            onTap: (){
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: (){
            },
          ),
          Logout(),
        ],
      ),
    );
  }
}

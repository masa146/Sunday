import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffa4d7ea),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "looking for what ?",
            style: TextStyle(color: Colors.blue[900]),
          ),
          backgroundColor: Colors.blue[200],
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/medicine.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color.fromARGB(255, 172, 219, 237).withOpacity(0.7),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 179, 220, 235),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Search",
                      suffixIcon: const Icon(Icons.search),
                      hintText: "Enter Name or Category : ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
              ),
            ),
          ],
        ));
  }
}

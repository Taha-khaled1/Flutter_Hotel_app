import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cities extends StatefulWidget {
  const Cities({Key? key}) : super(key: key);

  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  List cities = [
    {
      "name": "city",
      "image": "assets/Image/banner/banner1.jpg",
    },
    {
      "name": "town",
      "image": "assets/Image/banner/banner2.jpg",
    },
    {
      "name": "place",
      "image": "assets/Image/banner/banner3.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: Icon(
            Icons.clear,
            color: Colors.grey[800],
          ),
        ),
        title: Text("Cities", style: TextStyle(color: Colors.grey[800])),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        itemBuilder: (context, int i) {
          final item = cities[i];
          return Container(
            // width: Get.width * 0.8,
            height: Get.width * 0.6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: Get.width * 0.95,
                  height: Get.width * 0.6,
                  child: Image.asset(item['image'].toString().toLowerCase(), fit: BoxFit.cover),
                ),
                Container(
                  width: Get.width * 0.95,
                  height: Get.width * 0.6,
                  color: Colors.black.withOpacity(0.2),
                ),
                Text("${item['name']}", style: TextStyle(color: Colors.white),),
              ],
            ),
          );
        },
        separatorBuilder: (context, int i) {
          return SizedBox(height: 14);
        },
        itemCount: cities.length,
      ),
    );
  }
}

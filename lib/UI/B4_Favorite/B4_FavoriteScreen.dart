import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/my_widgets.dart';

import '../../Library/Ratting_Bar/Ratting_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  void initState() {
    super.initState();
    print("initState favorite");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafa),
        elevation: 0,
        title: Text(
          "My favorites".tr,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<FavoriteController>(
        builder: (controller) {
          return FutureBuilder(
            future: controller.getData(),
            builder: (context, AsyncSnapshot<List?>? snapshot) {
              if (snapshot!.hasData) {
                if (snapshot.data!.length == 0) {
                  return const Text("TheresNotData()");
                }
                return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  itemBuilder: (context, int i) {
                    final item = snapshot.data![i];
                    double rating = 0.0;
                    if (item['rating'] != null ||
                        item['rating'].toString() != "") {
                      rating = double.parse(item['rating'].toString());
                    }
                    double radius = 16.0;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(radius),
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(radius),
                            onTap: () async {},
                            child: Container(
                              width: Get.width,
                              height: 150,
                              child: Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.35,
                                    child: Image.asset(
                                      item['img'].toString().toLowerCase(),
                                      fit: BoxFit.cover,
                                      height: Get.height,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${item['name']}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "${item['location']}",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              const Icon(Icons.location_on,
                                                  size: 20, color: Colors.blue),
                                              Text("${item['distance']}",
                                                  style: const TextStyle(
                                                      fontSize: 12)),
                                            ],
                                          ),
                                          RatingBar.builder(
                                            initialRating: rating,
                                            itemSize: 18,
                                            minRating: 0.5,
                                            ignoreGestures: true,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0.0),
                                            itemBuilder: (context, int i) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(""),
                                      IconButton(
                                        onPressed: () async {},
                                        icon: const Icon(Icons.favorite,
                                            color: Colors.pink),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                end: 12, bottom: 12),
                                        child: Text(
                                          "\$${item['price']}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, int i) {
                    return const SizedBox(height: 22);
                  },
                  itemCount: snapshot.data!.length,
                );
              } else if (snapshot.hasError) {
                print("err2: ${snapshot.error}");
                return const ErrorServer();
              } else {
                return const WaitServer();
              }
            },
          );
        },
      ),
    );
  }
}

class FavoriteController extends GetxController {
  Future<List?>? getData() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        "img": "assets/Image/banner/banner1.jpg",
        "name": "Grand royal hotel",
        "location": "Wembley, london",
        "distance": "2.45km",
        "rating": "4.5",
        "price": "180",
      },
      {
        "img": "assets/Image/banner/banner2.jpg",
        "name": "Grand royal hotel",
        "location": "Wembley, london",
        "distance": "2.45km",
        "rating": "4.5",
        "price": "180",
      },
      {
        "img": "assets/Image/banner/banner5.jpg",
        "name": "Grand royal hotel",
        "location": "Wembley, london",
        "distance": "2.45km",
        "rating": "4.5",
        "price": "180",
      },
    ];
  }
}

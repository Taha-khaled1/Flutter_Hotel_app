import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../my_widgets.dart';

class Helps extends StatefulWidget {
  const Helps({Key? key}) : super(key: key);

  @override
  State<Helps> createState() => _HelpsState();
}

class _HelpsState extends State<Helps> {
  TextEditingController _txtsearch = TextEditingController();

  HelpsController helpsController = Get.put(HelpsController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(""),
        titleSpacing: -5,
      ),
      body: Container(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.blue,
              child: Container(
                width: Get.width,
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "How can we help",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _txtsearch,
                      decoration: InputDecoration(
                        hintText: "${"Search help".tr} ...",
                        prefixIcon: IconButton(
                          onPressed: () async {},
                          icon: const Icon(Icons.search_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 20),
            // Container(
            //   padding: EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 22),
            //   child: Text(
            //     "Paying for a reservation",
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // Divider(color: Colors.grey[300], height: 1, thickness: 2, endIndent: 8, indent: 8),
            Expanded(
              child: GetBuilder<HelpsController>(
                builder: (controller) {
                  return FutureBuilder(
                    future: controller.getData(),
                    builder: (context, AsyncSnapshot<List?>? snapshot) {
                      if (snapshot!.hasData) {
                        if (snapshot.data!.length == 0) {
                          return const TheresNotData();
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          itemBuilder: (context, int i) {
                            final item = snapshot.data![i];
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              title: Text("${item['name']}"),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black26,
                                size: 15.0,
                              ),
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      insetPadding: EdgeInsets.zero,
                                      titlePadding: EdgeInsets.zero,
                                      contentPadding: EdgeInsets.zero,
                                      actionsPadding: EdgeInsets.zero,
                                      buttonPadding: EdgeInsets.zero,
                                      //iconPadding: EdgeInsets.zero,
                                      content: Container(
                                        width: Get.width * 0.9,
                                        child: Wrap(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          direction: Axis.vertical,
                                          children: [
                                            const SizedBox(height: 12),
                                            Container(
                                              width: Get.width * 0.9,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "${item['name']}",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      padding: EdgeInsets.zero,
                                                    ),
                                                    onPressed: () async {},
                                                    child:
                                                        const Icon(Icons.close),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            Container(
                                              width: Get.width * 0.9,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Text("${item['desc']}"),
                                            ),
                                            const SizedBox(height: 12),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, int i) {
                            return Divider(
                                color: Colors.grey[300],
                                height: 1,
                                thickness: 1,
                                endIndent: 0,
                                indent: 0);
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
            ),
          ],
        ),
      ),
    );
  }
}

class HelpsController extends GetxController {
  Future<List?>? getData() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        "id": "1",
        "name": "How do I cancel my rooms reservation? ",
        "desc": "A cross platform plugin for displaying local notifications.",
      },
      {
        "id": "2",
        "name": "What methods of payment does rooms accept? ",
        "desc":
            "Schedule a notification to be shown daily at a specified time.",
      },
      {
        "id": "3",
        "name": "When am I charged for a reservation? ",
        "desc":
            "Ability to handle when a user has tapped on a notification, when the app is in the foreground, background or is terminated.",
      },
    ];
  }
}

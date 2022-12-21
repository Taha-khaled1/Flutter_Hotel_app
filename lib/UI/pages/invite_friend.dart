import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({Key? key}) : super(key: key);

  @override
  State<InviteFriend> createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafa),
        elevation: 0,
        title: const Text(""),
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.grey[800],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: Get.width * 0.8,
            height: Get.width * 0.8,
            child: Image.asset("assets/images/invite.png"),
          ),
          const Text(
            "Invite your friend",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          const Text(
            "are you one of those who makes everything at the last moment",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 33),
          SizedBox(
            height: 50,
            width: Get.width * 0.4,
            child: ElevatedButton.icon(
              onPressed: () async {},
              icon: const Icon(Icons.share),
              label: const Text("Share"),
            ),
          ),
        ],
      ),
    );
  }
}

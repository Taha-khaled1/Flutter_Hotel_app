import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/ShardFunction/handling.dart';
import 'package:hotelbooking/ShardFunction/statusrequst.dart';
import 'package:hotelbooking/UI/B1_Home/B1_Home_Screen/B1_Home_Screen.dart';
import 'package:hotelbooking/data/database/functions_response/get_Info_user.dart';
import 'package:hotelbooking/data/database/functions_response/updet_user.dart';
import 'package:hotelbooking/models/get_info_user_model.dart';

class EditProfileController extends GetxController {
  int y = 0;
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<FormState> formkeyedit = GlobalKey();
  String? email, image, countery, phone, username;

  late StatusRequest statusRequest1;
  GetInfoUserModel? infousetModel;
  getInfoProfile() async {
    statusRequest1 = StatusRequest.loading;
    update();
    var response = await getProfileRespon();
    statusRequest1 = handlingData(response);
    if (StatusRequest.success == statusRequest1) {
      infousetModel = await GetInfoUserModel.fromJson(response);
      print(
          '--------------------------------------------------------------------------');
    } else {
      print('erorr');
    }
    update();
  }

  @override
  void onInit() {
    getInfoProfile();
    super.onInit();
  }

  updateUser() async {
    if (formkeyedit.currentState!.validate()) {
      formkeyedit.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();
      var response = await updetUserRespons(
        country: countery,
        email: email,
        imgs: image,
        phone: phone,
        username: username,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.to(() => Home());

        showsnackBar('تم تحديث المعلومات بنجاح');
      } else {
        Get.to(() => Home());

        showsnackBar('لم يتم تحديث المعلومات');
      }
      update();
    } else {
      print('erorr');
    }
  }

  @override
  void dispose() {
    Get.delete<EditProfileController>();
    super.dispose();
  }
}

void showsnackBar(String masg) {
  Get.snackbar(
    "Status",
    masg,
    messageText: Text(
      masg,
      style: TextStyle(fontSize: 18, color: Colors.grey[300]),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.black,
  );
}

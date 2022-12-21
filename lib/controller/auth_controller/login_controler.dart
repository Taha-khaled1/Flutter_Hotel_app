import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/ShardFunction/handling.dart';
import 'package:hotelbooking/ShardFunction/statusrequst.dart';
import 'package:hotelbooking/UI/IntroApps/travelSelection.dart';
import 'package:hotelbooking/data/database/functions_response/LoginFunc.dart';
import 'package:hotelbooking/main.dart';

class LoginController extends GetxController {
  BuildContext context;
  LoginController(this.context);
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  late String emaillog, passwordlog;
  StatusRequest statusRequest = StatusRequest.none;
  login() async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();
      var respon = await loginRespons(emaillog, passwordlog);
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          if (respon['message'].toString() == 'success') {
            sharedPreferences.setString('id', respon['userId'].toString());
            sharedPreferences.setString(
                'username', respon['username'].toString());
            sharedPreferences.setString('email', respon['email'].toString());
            sharedPreferences.setString('phone', respon['phone'].toString());
            sharedPreferences.setString('city', respon['city'].toString());
            sharedPreferences.setString(
                'country', respon['country'].toString());
            sharedPreferences.setString(
                'isAdmin', respon['isAdmin'].toString());
            sharedPreferences.setString(
                'isOwner', respon['isOwner'].toString());
            sharedPreferences.setString('step', '2');
            Get.offAll(MainSelection());
            print('Sucss $respon');
          } else {
            statusRequest = StatusRequest.none;
            print('erorr $respon');
            showToast(respon['message']);
          }
        }
      } catch (e) {
        print('catch $e');
      }
      update();
    }
  }

  late FToast fToast;
  @override
  void onInit() {
    fToast = FToast();
    fToast.init(context);
    super.onInit();
  }

  showToast(String masge) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(
            masge,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
  }
}

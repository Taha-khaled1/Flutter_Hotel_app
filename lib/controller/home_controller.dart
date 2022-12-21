import 'package:get/get.dart';
import 'package:hotelbooking/ShardFunction/handling.dart';
import 'package:hotelbooking/ShardFunction/statusrequst.dart';
import 'package:hotelbooking/data/database/functions_response/get_cities.dart';
import 'package:hotelbooking/data/database/functions_response/get_top_boking.dart';
import 'package:hotelbooking/data/database/functions_response/get_top_reating.dart';
import 'package:hotelbooking/data/database/functions_response/get_types.dart';
import 'package:hotelbooking/models/cities_model.dart';
import 'package:hotelbooking/models/get_top_reating_model.dart';
import 'package:hotelbooking/models/types_model.dart';

class HomeController extends GetxController {
  GetTopReatingModel? getTopReatingModel;
  GetTopReatingModel? getTopBokingModel;
  CitisModel? getCitesModel;
  TypesModel? getTypesModel;
  late StatusRequest statusRequest;
  late StatusRequest statusRequest1;
  late StatusRequest statusRequest2;
  late StatusRequest statusRequest3;
  getdataTopreating() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getTopReating();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      getTopReatingModel = await GetTopReatingModel.fromJson(response);
      print('getTopReatingModel');
    } else {
      print('erorr');
    }
    update();
  }

  getdataBoking() async {
    statusRequest1 = StatusRequest.loading;
    update();
    var response = await getTopBoking();
    statusRequest1 = handlingData(response);
    if (StatusRequest.success == statusRequest1) {
      getTopBokingModel = await GetTopReatingModel.fromJson(response);
    } else {
      print('erorr');
    }
    update();
  }

  getCiteisdata() async {
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await getCitesRespon();
    statusRequest2 = handlingData(response);
    if (StatusRequest.success == statusRequest2) {
      getCitesModel = await CitisModel.fromJson(response);
    } else {
      print('erorr');
    }
    update();
  }

  getTypesdata() async {
    statusRequest3 = StatusRequest.loading;
    update();
    var response = await getTypesRespon();
    statusRequest3 = handlingData(response);
    if (StatusRequest.success == statusRequest3) {
      getTypesModel = await TypesModel.fromJson(response);
    } else {
      print('erorr');
    }
    update();
  }

  @override
  void onInit() {
    getdataTopreating();
    getdataBoking();
    getCiteisdata();
    getTypesdata();
    super.onInit();
  }
}

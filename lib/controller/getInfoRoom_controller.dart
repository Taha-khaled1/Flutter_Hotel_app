import 'package:get/get.dart';
import 'package:hotelbooking/ShardFunction/handling.dart';
import 'package:hotelbooking/ShardFunction/statusrequst.dart';
import 'package:hotelbooking/data/database/functions_response/get_info_room.dart';
import 'package:hotelbooking/main.dart';
import 'package:hotelbooking/models/info_room_model.dart';

class GetInfoRoomController extends GetxController {
  int y = 0;
  late StatusRequest statusRequest;
  InfoRoomModel? infoRoomModel;
  getdataTopreating(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getInfoRoomRespon(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      infoRoomModel = await InfoRoomModel.fromJson(response);
      print(
          '--------------------------------------------------------------------------');
    } else {
      print('erorr');
    }
    update();
  }

  @override
  void onInit() {
    getdataTopreating(
        sharedPreferences.getString('keyroom') ?? '63984eda6f4969c0dfd86626');
    super.onInit();
  }
}

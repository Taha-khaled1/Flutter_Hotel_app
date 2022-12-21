// ignore_for_file: file_names

import 'package:hotelbooking/data/database/connectdatabase.dart';
import 'package:hotelbooking/main.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';

updetUserRespons({
  String? username,
  String? country,
  String? phone,
  String? imgs,
  String? email,
}) async {
  Curd curd = Curd();
  var respons = await curd.putrequest(
    '${MangeAPi.updateUser}/${sharedPreferences.getString('id')}',
    {
      'username': username,
      'country': country,
      'phone': phone,
      'imgs': 'imgs',
      'email': sharedPreferences.getString('email'),
    },
  );
  print(respons);
  return respons;
}

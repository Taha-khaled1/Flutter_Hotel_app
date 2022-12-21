// ignore_for_file: file_names
import 'package:hotelbooking/data/database/connectdatabase.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';

loginRespons(
  String email,
  String password,
) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    MangeAPi.login,
    {
      'email': email,
      'password': password,
    },
    encode: true,
  );
  return respons;
}

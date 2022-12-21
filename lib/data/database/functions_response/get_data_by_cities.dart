// ignore_for_file: file_names

import 'package:hotelbooking/data/database/connectdatabase.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';

getdataFromCitesRespon(String idcity) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${MangeAPi.getdatabycities}/$idcity',
  );
  print(respons);
  return respons;
}

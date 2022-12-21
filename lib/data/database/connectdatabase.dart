// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:hotelbooking/ShardFunction/checkenternet.dart';
import 'package:hotelbooking/ShardFunction/statusrequst.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path/path.dart';
// headers: <String, String>{'Content-Type': 'application/json'},
// String _basicAuth = 'Basic ${base64Encode(utf8.encode('wael:wael1'))}';

Map<String, String> myheaders = {'Content-Type': 'application/json'};
Map<String, String> myheaders2 = {
  'Cookie':
      'access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYTEyMWI1NmNjOThhYjY0YzI4MTgyOCIsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NzE1NTI0OTN9.J_6IKlm8_vBUI3lMrhWZVLRjHuEMnYkKPew7X4UhFLo; Path=/;'
};

class Curd {
  getrequest(String url) async {
    try {
      Response respos = await http.get(Uri.parse(url));
      if (respos.statusCode == 200) {
        dynamic body = jsonDecode(respos.body);
        return body;
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print('$e');
    }
  }

  postrequest(String url, Map data, {bool? encode}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.post(Uri.parse(url),
            body: encode == true ? jsonEncode(data) : data, headers: myheaders);
        if (respos.statusCode == 200) {
          dynamic body = jsonDecode(respos.body);

          return body;
        } else {
          return StatusRequest.serverfailure;
        }
      } else {
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      return StatusRequest.serverfailure;
    }
  }

  putrequest(String url, Map data, {bool? encode}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.put(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheaders2,
        );
        if (respos.statusCode == 200) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print(respos.body);
          return StatusRequest.serverfailure;
        }
      } else {
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('ERorr $e');
      return StatusRequest.erorr;
    }
  }

  strequestforFile(
    String url,
    namepost,
    Map data,
    File file,
  ) async {
    MultipartRequest requst = http.MultipartRequest('Post', Uri.parse(url));
    int length = await file.length();
    ByteStream stream = http.ByteStream(file.openRead());
    MultipartFile multefile = http.MultipartFile(namepost, stream, length,
        filename: basename(file.path));
    requst.headers.addAll(myheaders);
    requst.files.add(multefile);
    data.forEach((key, value) {
      requst.fields[key] = value;
    });
    StreamedResponse myrequest = await requst.send();
    Response response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {}
  }
}

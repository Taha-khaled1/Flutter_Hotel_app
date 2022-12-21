import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotelbooking/UI/B2_Message/Chatting/chatting.dart';
import 'package:http/http.dart';

class callCenter extends StatefulWidget {
  @override
  _callCenterState createState() => _callCenterState();
}

class _callCenterState extends State<callCenter> {
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController msgController = TextEditingController();

  void Send(String email, subject, msg) async {
    try {
      var url = "http://localhost:3000/api/users/sendEmail";
      var response = await post(
        Uri.parse(url),
        body: jsonEncode(<String, String>{
          "email": email,
          "subject": subject,
          "message": msg,
        }),
        headers: <String, String>{'Content-Type': 'application/json'},
      ).then((value) {
        var data = jsonDecode(value.body.toString());
        if (value.statusCode == 200) {
          print(data['error'] ?? data['message']);
        } else {
          print('failed');
        }
      });
      ;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Call Center",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: Colors.black54,
              fontFamily: "Gotik"),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF6991C7)),
        elevation: 0.0,
      ),
      body: Container(
          color: Colors.white,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/image/illustration/girlcallcenter.png",
                height: 80.0,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 14.0),
                child: Text(
                  "We're Happy to Help You!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.only(start: 12),
                      child: Text("Email"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: emailController,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.only(start: 12),
                      child: Text("Subject"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      maxLength: 100,
                      controller: subjectController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.topic,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.only(start: 12),
                      child: Text("Message"),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLength: 500,
                      maxLines: 3,
                      controller: msgController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        prefixIcon: Icon(
                          Icons.subject,
                          size: 20,
                        ),

                        // enabledBorder: OutlineInputBorder(
                        //   borderSide:
                        //   BorderSide(width: 3, color: Colors.black12), //<-- SEE HERE
                        //   borderRadius: BorderRadius.circular(0.0),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: InkWell(
                  onTap: () {
                    Send(
                        emailController.text.toString(),
                        subjectController.text.toString(),
                        msgController.text.toString());
                  },
                  child: Center(
                    child: Container(
                      height: 50.0,
                      width: 280.0,
                      decoration: const BoxDecoration(
                          color: Color(0xFF8DA2BF),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      child: const Center(
                          child: Text(
                        "Send",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ))),
    );
  }
}

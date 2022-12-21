import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hotelbooking/Library/SupportingLibrary/Animation/LoginAnimation.dart';
import 'package:hotelbooking/Library/intro_views_flutter-2.4.0/lib/UI/page.dart';
import 'package:hotelbooking/Library/intro_views_flutter-2.4.0/lib/intro_views_flutter.dart';
import 'package:hotelbooking/UI/IntroApps/Login.dart';
import 'package:http/http.dart' as http;
import 'package:hotelbooking/UI/IntroApps/travelSelection.dart';
import 'SignUp.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scakey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  Future<void> signup(String username, String email, String password,
      String repassword, String country, String city, String phone) async {
    try {
      var url = "http://localhost:3000/api/users/auth/register";
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'password': password,
          'repassword': repassword,
          'country': country,
          'city': city,
          'phone': phone
        }),
        headers: <String, String>{'Content-Type': 'application/json'},
      ).then((value) {
        var data = jsonDecode(value.body.toString());
        String ss = "Verification email is sent to your gmail account";
        if (value.statusCode == 200) {
          String val = data.toString();

          print(data['message'] ?? data['error']);

          if (data['message'] == ss) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (route) => false);
          }

          //    // Navigator.of(context).push(MaterialPageRoute(builder:(context){
          //    //   return forgetPass();
          //    // }));

        } else {
          print('failed');
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override

  //Animation Declaration
  late AnimationController sanimationController;

  var tap = 0;

  @override

  /// set state animation controller
  void initState() {
    sanimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addStatusListener((statuss) {
        if (statuss == AnimationStatus.dismissed) {
          setState(() {
            tap = 0;
          });
        }
      });
    // TODO: implement initState
    super.initState();
  }

  /// Dispose animation controller
  @override
  void dispose() {
    sanimationController.dispose();
    super.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _PlayAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scakey,
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          // ElevatedButton(onPressed:(){
          //
          // },
          // child:Text:("click"),
          // ),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// Image Top
                  Container(
                    height: 220,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          height: 270,
                          width: width + 20,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/destinationPopuler/tripBackground.png'),
                                    fit: BoxFit.fill)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Signup",
                          style: TextStyle(
                              fontFamily: "Sofia",
                              fontWeight: FontWeight.w800,
                              fontSize: 37.5,
                              wordSpacing: 0.1),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                const BoxShadow(
                                  color: Color.fromRGBO(196, 135, 198, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]!))),
                                child: TextFormField(
                                  controller: usernameController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "User Name",
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.black12,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "sofia")),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]!))),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      icon: Icon(
                                        Icons.email,
                                        color: Colors.black12,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "sofia")),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]!))),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "password",
                                      icon: Icon(
                                        Icons.password,
                                        color: Colors.black12,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "sofia")),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]!))),
                                child: TextFormField(
                                  controller: repasswordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Confirm password",
                                      icon: Icon(
                                        Icons.lock,
                                        color: Colors.black12,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "sofia")),
                                  validator: (val) {
                                    if (repasswordController !=
                                        passwordController.text) {
                                      return 'invalid input';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]!))),
                                child: TextFormField(
                                  controller: countryController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Country",
                                      icon: Icon(
                                        Icons.location_city,
                                        color: Colors.black12,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "sofia")),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]!))),
                                child: TextFormField(
                                  controller: cityController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "City",
                                      icon: Icon(
                                        Icons.location_city_outlined,
                                        color: Colors.black12,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "sofia")),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: phoneController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Phone",
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.black12,
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "sofia")),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const Login(),
                                      transitionDuration:
                                          const Duration(milliseconds: 2000),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return Opacity(
                                          opacity: animation.value,
                                          child: child,
                                        );
                                      }));
                            },
                            child: const Text(
                              "Have Account? Login",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontFamily: "Sofia",
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1.3),
                            )),
                        const SizedBox(
                          height: 90,
                        ),
                      ],
                    ),
                  )
                ],
              ),

              /// Set Animaion after user click buttonSignup
              tap == 0
                  ? InkWell(
                      splashColor: Colors.yellow,
                      onTap: () {
                        setState(() {
                          tap = 1;
                        });
                        LoginAnimation(
                          animationController:
                              sanimationController.view as AnimationController,
                        );
                        _PlayAnimation();
                      },
                      child: GestureDetector(
                        onTap: () {
                          signup(
                              usernameController.text.toString(),
                              emailController.text.toString(),
                              passwordController.text.toString(),
                              repasswordController.text.toString(),
                              countryController.text.toString(),
                              cityController.text.toString(),
                              phoneController.text.toString());
                        },
                        child: Container(
                          height: 55.0,
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF8DA2BF),
                          ),
                          child: const Center(
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Sofia",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17.5,
                                  letterSpacing: 1.2),
                            ),
                          ),
                        ),
                      ),
                    )
                  : LoginAnimation(
                      animationController:
                          sanimationController.view as AnimationController,
                    )
            ],
          ),
        ],
      ),
    );
  }
}

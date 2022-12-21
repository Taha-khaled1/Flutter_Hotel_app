import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';
import 'package:hotelbooking/UI/B1_Home/B1_Home_Screen/B1_Home_Screen.dart';
import 'package:hotelbooking/UI/B1_Home/B1_Home_Screen/editProfile.dart';
import 'package:hotelbooking/UI/IntroApps/travelSelection.dart';
import 'package:hotelbooking/translation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'funs.dart' as f;

import 'classes.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  HttpOverrides.global = MyHttpOverrides();

  // await Firebase.initializeApp();
  await GetStorage.init();

  f.getFCMToken();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //   statusBarColor: Colors.transparent,
    // ));

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff424242), // navigation bar color
      // statusBarColor: Colors.grey, // status bar color
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      home: MainSelection(), //SplashScreen(),
      // home: BottomNavBar(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColorLight: Colors.white,
        primaryColor: Colors.white,
        sliderTheme: SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(55),
            gapPadding: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(55),
            gapPadding: 0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.pink,
            ),
            borderRadius: BorderRadius.circular(55),
            gapPadding: 0,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(55),
            gapPadding: 0,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(55),
            gapPadding: 0,
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(55),
            borderSide: BorderSide(
              color: Colors.red,
            ),
            gapPadding: 0,
          ),
          labelStyle: TextStyle(
            height: 1,
          ),
          hintStyle: TextStyle(
            height: 1.5,
            color: Colors.grey[400],
          ), // height: 2.5
          helperStyle: TextStyle(
            height: 1.4,
          ),
          helperMaxLines: 3,
          fillColor: Colors.white,
          filled: true,
          errorStyle: TextStyle(height: 1.4),
        ),
      ),

      // lang _________________________________________________
      translations: Translation(),
      locale: Locale(f.appLang()),
      // locale: Locale("en"),
      fallbackLocale: Locale("ar"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // DefaultWidgetsLocalizations.delegate,
        // DefaultCupertinoLocalizations.delegate,
        // DefaultMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar'),
        const Locale('en'),
      ],
      // end lang _________________________________________________
    );
  }
}

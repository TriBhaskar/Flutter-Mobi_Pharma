import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/views/splash%20screen/splash_screen.dart';
import 'consts/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //we are using getx so we have to change this material app into getmaterial app
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: darkGreen,
          ),
          backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
    home: const SplashScreen(),
    );
  }
}
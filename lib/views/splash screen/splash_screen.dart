import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/colors.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/views/auth_screen/login_screen.dart';
import 'package:mobi_pharma/widgets_common/applogo_widget.dart';

import '../home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //creating method to cahnge screen
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      //using getx
      //Get.to(()=>const LoginScreen());
      auth.authStateChanges().listen((User? user) { 
        if(user ==null && mounted){
          Get.to(()=>const LoginScreen());
        }else{
          Get.to(()=>const Home());
        }
      });

    });
  }
  
@override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grassColor,
      body: Center(
        child: Column(
          children: [
            300.heightBox,
          applogoWidget(),
          10.heightBox,
          appversion.text.white.make(),
          const Spacer(),
          credits.text.white.fontFamily(semibold).make(),
          30.heightBox,
          //Spash screen UI
        ]),
      ),
    );
  }
}
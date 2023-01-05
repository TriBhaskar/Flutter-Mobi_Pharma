import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/consts/lists.dart';
import 'package:mobi_pharma/controllers/auth_controller.dart';
import 'package:mobi_pharma/views/auth_screen/signup_screen.dart';
import 'package:mobi_pharma/views/home_screen/home.dart';
import 'package:mobi_pharma/widgets_common/applogo_widget.dart';
import 'package:mobi_pharma/widgets_common/bg_widget.dart';
import 'package:mobi_pharma/widgets_common/our_button.dart';

import '../../widgets_common/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) :  super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());





    return bgWiget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
            applogoWidget(),
            20.heightBox,

            Obx(
              ()=> Column(
                children: [
                  customTextField(hint: emailHint,title: email, isPass: false, controller: controller.emailController),
                  customTextField(hint: passwordHint,title: password, isPass: true, controller: controller.passwordController),
                  Align( 
                    alignment : Alignment.centerRight,
                    child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
                    5.heightBox,
                    // ourButton().box.width(context.screenWidth -50).make(),
                    controller.isloading.value 
                    ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(grassColor),
                    ): ourButton(
                    color: grassColor,
                    title: login, 
                    textColor: whiteColor, 
                    onPress: () async{

                      controller.isloading(true);

                      await controller.loginMethod(context: context).then((value){
                        if(value!=null){
                          VxToast.show(context, msg: loggedin);
                          Get.offAll(()=> const Home());
                        }else{
                          controller.isloading(false);
                        }
                      });
                      //Get.to(()=> const Home());
                    },
                    ).box.width(context.screenWidth -50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton( color: darkFontGrey,title: signup, textColor: whiteColor, onPress: (){
                    Get.to(()=>const SignupScreen());
                  }).box.width(context.screenWidth -50).make(),
                  
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3,
                     (index) => Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(socialIconList[index], width: 30,),
                    ),
                     )),
                  ),
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
            )
          ],
        ),
      ),
    ));
  }
}
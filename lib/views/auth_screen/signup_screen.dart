import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // get socialIconList => null;
bool? iscCheck = false;

  @override
  Widget build(BuildContext context) {
    return bgWiget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
            applogoWidget(),
            20.heightBox,

            Column(
              children: [

                customTextField(hint: nameHint,title: name),
                customTextField(hint: emailHint,title: email),
                customTextField(hint: passwordHint,title: password),
                customTextField(hint: passwordHint,title: retypePassword),
                Align( 
                  alignment : Alignment.centerRight,
                  child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
                  5.heightBox,
                  // ourButton().box.width(context.screenWidth -50).make(),
                Row(
                  children: [
                    Checkbox(
                      checkColor: darkGreen,
                      value: iscCheck, 
                    onChanged: (newValue){
                      setState(() {
                      iscCheck = newValue;
                      });
                    },),
                    10.widthBox,
                    Expanded(
                      child: RichText(text: const TextSpan(
                        children: [
                          TextSpan(text: "I agree to the ", style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey,
                          )),
                          TextSpan(text: termAndCond , style: TextStyle(
                            fontFamily: bold,
                            color: darkGreen,
                          )),
                          TextSpan(text: privacyPolicy, style: TextStyle(
                            fontFamily: bold,
                            color: darkGreen,
                          ))
                        ]
                      )),
                    )
                  ],
                ),
                ourButton( color: iscCheck == true? grassColor : lightGrey,title: signup, textColor: whiteColor, onPress: (){}).box.width(context.screenWidth -50).make(),

                10.heightBox,
                //Wrapping into gesture detetctor of velocity x
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alreadyHaveAccount.text.color(fontGrey).make(),
                    login.text.color(grassColor).make().onTap(() {
                      Get.back();
                    })
                  ],
                )
              ],
            ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make()
          ],
        ),
      ),
    ));
  }
}
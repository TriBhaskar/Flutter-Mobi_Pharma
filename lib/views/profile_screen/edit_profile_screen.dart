import 'dart:io';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/controllers/profile_controller.dart';
import 'package:mobi_pharma/widgets_common/bg_widget.dart';
import 'package:mobi_pharma/widgets_common/custom_textfield.dart';
import 'package:mobi_pharma/widgets_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {

  final dynamic data;


  const EditProfileScreen({super.key,this.data});

  @override
  Widget build(BuildContext context) {

    var controller =Get.find<ProfileController>();
    

    return bgWiget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
          children: [

            //if data image url and controller path is empty
        
         data['imageUrl'] == '' &&  controller.profileImgPath.isEmpty
            ? Image.asset(imgProfile2, width: 120, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make() 
            //if data is not empty but controller path is empty
            :data['imageUrl'] != '' && controller.profileImgPath.isEmpty
            ?
            Image.network(data['imageUrl'],width: 100,
              fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
            //if both are empty
            :
              Image.file(
              File(controller.profileImgPath.value),
              width: 100,
              fit: BoxFit.cover,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
                 10.heightBox,
                 ourButton(color: grassColor,
                 onPress:(){
                  controller.changeImage(context);
                 },textColor: whiteColor,title: "Change"),
                 const Divider(),
                 20.heightBox,
                 customTextField(
                  controller: controller.nameController,
                  hint: nameHint,
                  title: name,
                  isPass: false
                 ),
        
                  customTextField(
                    controller: controller.passController,
                  hint: passwordHint,
                  title: password,
                  isPass: true
                 ),
                 20.heightBox,
                    controller.isloading.value? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(grassColor),
                    ):   SizedBox(
                  width: context.screenWidth -60,
                  child: ourButton(
                    color: grassColor,
                    onPress:() async{
                    controller.isloading(true);
                   await controller.uploadProfileImage();
                    await controller.updateProfile(
                      imgUrl: controller.profileImageLink,
                      name: controller.nameController.text,
                      password: controller.passController.text,
                    );
                    VxToast.show(context, msg: "Updated");


                  },textColor: whiteColor,title: "Save")),
          ],
          ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50,left: 12,right: 12)).rounded.make(),
        ),
      )
    );
  }
}
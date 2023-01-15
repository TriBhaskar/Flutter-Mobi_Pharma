import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/controllers/home_controller.dart';
import 'package:mobi_pharma/controllers/profile_controller.dart';

class CartController extends GetxController {
  var totalP =0.obs; 
  //text controllers for shipping

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var phoneController = TextEditingController();
  var postalcodeController = TextEditingController();



  calculate(data){
    totalP.value = 0;
    for(var i =0; i< data.length; i++){
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

// uploadProfileImage() async{
//   var filename =basename(profileImgPath.value);
//   var destination = 'images/${currentUser!.uid}/$filename';
//   Reference ref = FirebaseStorage.instance.ref().child(destination);
//   await ref.putFile(File(profileImgPath.value));
//   profileImageLink = await ref.getDownloadURL();
// }


  placeMyorder() async{
    await firestore.collection(ordersCollection).doc().set({
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email': currentUser!.email,
      'order_by_address':addressController.text,
      'order_by_state':stateController.text,
      'order_by_city':cityController.text,
      'order_by_phone':phoneController.text,
      'order_by_postalcode':postalcodeController.text,
      'shipping_method':"Home Delivery",
      'payment_method':'NetBanking'


    });
  }
  }
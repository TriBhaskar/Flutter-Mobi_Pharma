import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/controllers/home_controller.dart';
import 'package:mobi_pharma/controllers/profile_controller.dart';
import 'package:mobi_pharma/views/cart_screen/payment_method.dart';

class CartController extends GetxController {
  var totalP =0.obs; 
  //text controllers for shipping

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var phoneController = TextEditingController();
  var postalcodeController = TextEditingController();

  late dynamic productSnapshot;
  var products=[];

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


  placeMyorder({required paymentImage,required totalAmount}) async{

    await getProductsDetails();

    await firestore.collection(ordersCollection).doc().set({
      'order_code':"12345",
      'order_by': currentUser!.uid,
      'order_date': FieldValue.serverTimestamp(),
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email': currentUser!.email,
      'order_by_address':addressController.text,
      'order_by_state':stateController.text,
      'order_by_city':cityController.text,
      'order_by_phone':phoneController.text,
      'order_by_postalcode':postalcodeController.text,
      'shipping_method':"Home Delivery",
      'payment_method':'NetBanking',
      'payment_receipt': paymentImage,
      'order_placed': true,
      'order_confirmed':false,
      'order_delivered':false,
      'order_on_delivery':false,
      'total_amount': totalAmount,
      'orders':FieldValue.arrayUnion(products),

    });
  }

  getProductsDetails(){
    products.clear();
    for(var i=0; i< productSnapshot.length; i++){
      products.add({
        'img':productSnapshot[i]['img'],
        'qty':productSnapshot[i]['qty'],
        'title':productSnapshot[i]['title'],
      });
    }
    print(products);
  }

  }
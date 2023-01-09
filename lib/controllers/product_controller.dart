import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:mobi_pharma/consts/consts.dart';

class ProductController extends GetxController{

  var quantity = 0.obs;
  var totalPrice = 0.obs;

  increaseQuantity(totalQuantity){
    if(quantity.value<totalQuantity){
      quantity.value++;
    }
}

 decreaseQuantity(){
  if(quantity.value>0)
  {quantity.value--;}
  
 }

 calculateTotalPrice(price){
  totalPrice.value = price * quantity.value;
 }

  resetValues(){
    totalPrice.value=0;
    quantity.value =0;
  }


 addToCart({title, img,qty,tprice,context}) async{
  await firestore.collection(cartCollection).doc().set({
'title':title,
'img':img,
'qty':qty,
'tprice':tprice,
'added_by':currentUser!.uid
  }).catchError((error){
    VxToast.show(context, msg: error.toString());
  });
 }
}


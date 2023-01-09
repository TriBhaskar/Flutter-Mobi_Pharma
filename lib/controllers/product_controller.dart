import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:io';

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

}


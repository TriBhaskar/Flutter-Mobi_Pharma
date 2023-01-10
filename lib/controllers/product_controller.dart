import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:mobi_pharma/consts/consts.dart';

class ProductController extends GetxController{

  var quantity = 0.obs;
  var totalPrice = 0.obs;

  var isFav =false.obs;

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


  //wishlist
  addToWishlist(docId,context) async{
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist':FieldValue.arrayUnion([
        currentUser!.uid])
    },SetOptions(merge: true));
    isFav(true);

    VxToast.show(context, msg: "Added to wishlist");
  }

   removeFromWishlist(docId,context) async{
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist':FieldValue.arrayRemove([
        currentUser!.uid])
    },SetOptions(merge: true));

    isFav(false);
    
    VxToast.show(context, msg: "Removes from wishlist");

  }

  checkIfFav(data) async{
    if(data['p_wishlist'].contains(currentUser!.uid)){
        isFav(true);
    }else{
      isFav(false);
    }
  }



}


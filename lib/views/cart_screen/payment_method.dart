
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobi_pharma/views/cart_screen/pick_image.dart';
import 'package:mobi_pharma/widgets_common/custom_textfield.dart';

import '../../widgets_common/our_button.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  var pickedimage;
  String imagename='';
  // final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
FirebaseStorage storageRef = FirebaseStorage.instance;

//image select for payment
      imagepick() async{
        final XFile? image =await ImagePicker().pickImage(source: ImageSource.gallery);
        setState(() {
          pickedimage=image;
          imagename=image!.name.toString();
          print(imagename);
      // pickedimage!.path.split('/').last
    }); 
  }

  //upload image

@override

  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: () async {
            
          },
          color: Colors.red,
          textColor: whiteColor,
          title: "Place my order",
          
        ),
      ),
      appBar: AppBar(
        title: "Choose Payment Method".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),

      body:
       Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(imgbank,height: 320,
                    width: double.infinity,
                    fit: BoxFit.cover,),
                const Text('!! After payment kindly attached the reciept or scrrenshot of your successful payment !!',style: TextStyle(fontSize: 18.0,color: Color.fromARGB(255, 255, 137, 68))),
      20.heightBox,
                
                Text(pickedimage == null ?  'No Image selected' : imagename),               
               
                10.heightBox,
                     ourButton(color: grassColor,
                     onPress:(){
                     imagepick();
                     },textColor: whiteColor,title: "upload image"),
              ],
              
            ),
          ),
        ),
      );
  }
}
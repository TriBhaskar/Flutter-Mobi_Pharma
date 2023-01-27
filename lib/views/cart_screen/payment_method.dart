
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mobi_pharma/controllers/cart_controller.dart';
import 'package:mobi_pharma/views/home_screen/home.dart';
import 'package:mobi_pharma/widgets_common/loading_indicator.dart';
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

var controller = Get.find<CartController>();

  var pickedimage;
  String imagename='';
  var ImageLink = '';
 XFile? sfile;
  var imagepath ='';
  // final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
FirebaseStorage storageRef = FirebaseStorage.instance;

//image select for payment
      imagepick() async{
        final XFile? image =await ImagePicker().pickImage(source: ImageSource.gallery);
        setState(() {
          pickedimage=image;
          sfile = image;
        //  imagepath.value = image!.path;
          imagename=image!.name.toString();
          //print(imagename);
      // pickedimage!.path.split('/').last
    }); 
  }

  //upload image
  uploadImage(XFile sfile) async{
  var filename =imagename;
  var destination = 'Payment/${currentUser!.uid}/$filename';
 // print(destination);//correct
  Reference ref = storageRef.ref().child(destination);
  await ref.putFile(File(sfile.path));
  ImageLink = await ref.getDownloadURL();//link of the image
//  print("sadsadsad ${ImageLink}");
  
}

@override

  Widget build(BuildContext context) {

    return Obx(()=> Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: controller.placingOrder.value ? Center(
            child: loadingIndicator(),
          )
          : ourButton(
            onPress: () async {
           await uploadImage(sfile!);
              controller.placeMyorder(paymentImage:ImageLink,totalAmount: controller.totalP.value);
              await controller.clearCart();
              Get.offAll(const Home());
              VxToast.show(context, msg: "Order placed successfully");
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
        ),
    );
  }
}
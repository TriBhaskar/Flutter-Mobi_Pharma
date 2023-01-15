// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import '../../consts/consts.dart';

// class ImagePickerController extends GetxController {
  
//   // var imageFile=''.obs;
//   // File _image;
//   imagepick(context) async{
//   try{
//     final img = await ImagePicker().pickImage(source: ImageSource.gallery);
//     // setState()
//   if(img== null) {
//     VxToast.show(context, msg: 'Image not selected');
//   } else {
//     // imageFile.va = img.path;
//     VxToast.show(context, msg: 'Image selected');
//   }
//   }on PlatformException catch (e){
//     VxToast.show(context, msg: 'Some problem!!');
//   }
// }
// }
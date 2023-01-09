// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/controllers/cart_controller.dart';
import 'package:mobi_pharma/services/firestore_services.dart';
import 'package:mobi_pharma/widgets_common/loading_indicator.dart';
import 'package:mobi_pharma/widgets_common/our_button.dart';

import '../../consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Medi-Cart".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),

      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid),

        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
         if(!snapshot.hasData){
          return Center(
            child: loadingIndicator(),
          );
         }else if(snapshot.data!.docs.isEmpty){
          return Center(
            child: "Cart is empty".text.color(darkFontGrey).size(25).make(),
          );
         }else{
          var data = snapshot.data!.docs;
          controller.calculate(data);


          return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [   
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context,int index) {
                return ListTile(
                  leading: Image.network(
                    "${data[index]['img']}",
                    width: 130,
                    height: 300,fit: BoxFit.fill,
                    ),
                  title: "${data[index]['title']}   (x${data[index]['qty']})"
                  .text.fontFamily(semibold)
                  .size(18)
                  .make(),
                  subtitle: "₹ ${data[index]['tprice']}".text.fontFamily(semibold).color(Colors.greenAccent).size(15).make(),
                  trailing: const Icon(
                    Icons.delete, 
                    color: Colors.red,
                    ).onTap(() { 
                      FirestoreServices.deleteDocument(data[index].id);
                    }),
                  );
              },
            )
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Total price".text.fontFamily(semibold).color(darkFontGrey).make(),

              Obx(
                ()=> "₹ ${controller.totalP.value}".text.fontFamily(semibold).color(Colors.red).make()),
            ],
          ).box.padding(const EdgeInsets.all(12)).width(context.screenWidth-60).color(lightGolden).roundedSM.make(),
            10.heightBox,
              SizedBox(
                width: context.screenWidth -60,
                child: ourButton(
                  color: Colors.amber,
                  onPress: (){},
                  textColor: whiteColor,
                  title: "Proceed to shipping",
                ),
                ),
          ]
        ),
      );
         }
        },
      ),
    );
  }
}
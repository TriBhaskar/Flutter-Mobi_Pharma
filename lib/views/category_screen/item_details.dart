import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/controllers/product_controller.dart';
import 'package:mobi_pharma/widgets_common/our_button.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({super.key, required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
   // var controller = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: ()async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            controller.resetValues();
            Get.back();
          }, icon: const Icon(Icons.arrow_back),),
          title: title!.text.color(darkGreen).fontFamily(bold).make(),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.share,)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline,)),
          ],
        ),
        body: Column(
          children: [
            Expanded(child: Container(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //swipper section
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16/9,
                      viewportFraction: 1.0,
                      itemCount: data['p_imgs'].length, 
                      itemBuilder: (context, index) {
                      return Image.network(data['p_imgs'][index],width: double.infinity,fit: BoxFit.cover,);
                    }),
    
                    10.heightBox,
                    //title and details section
                    title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                    10.heightBox,
                    //rating
                    VxRating(
                      isSelectable: false,
                    value: double.parse(data['p_rating']),  
                    onRatingUpdate: (value){},
                    normalColor: textfieldGrey,
                    selectionColor: Colors.amberAccent,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                    ),
    
                    10.heightBox,
                    "₹ ${data['p_price']}".text.size(24).color(Colors.redAccent).fontFamily(bold).make(),
    
                    10.heightBox,
    
                    Row(
                      children: [
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
    
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.heightBox,
                            "${data['p_symtoms']}".text.black.fontFamily(semibold).size(16).make(),
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.message_rounded,  color: darkFontGrey),
                        ),
                      ],
                    ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),
    
                    20.heightBox,
    
                    //quantity row
                    
                      
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Quantity :".text.size(18).color(textfieldGrey).make(),
                                ),
                                Obx(()=> Row(
                                    children: [
                                      IconButton(onPressed: (){
                                        controller.decreaseQuantity();
                                        controller.calculateTotalPrice(int.parse(data['p_price']));
                                      }, 
                                      icon: const Icon(Icons.remove)),
                                      controller.quantity.value.text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                      IconButton(
                                        onPressed: (){
                                        controller.increaseQuantity(int.parse(data['p_quantity']));
                                        controller.calculateTotalPrice(int.parse(data['p_price']));
                                      }, 
                                      icon: const Icon(Icons.add)),
                                      10.widthBox,
                                      "(${data['p_quantity']}  available)".text.color(textfieldGrey).make(),
                                    ],
                                  ),
                                ),
    
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
    
    
                              Obx(()=> Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: "Total :".text.size(18).color(textfieldGrey).make(),
                                    ),
                                    "₹ ${controller.totalPrice.value}".text.color(Colors.redAccent).size(18).fontFamily(bold).make(),
                              
                                  ],
                                ).box.padding(const EdgeInsets.all(8)).make(),
                              ),
                          ],
                       ).box.white.make(),
    
                    //discription more
                    10.heightBox,
                    "Description".text.size(18).color(darkFontGrey).fontFamily(semibold).make(),
                    10.heightBox,
                    "${data['p_desc']}".text.color(darkFontGrey).make(),
                    ],
                ),
              ),
              )),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                color: Colors.red,
                onPress: (){
                  controller.addToCart(
                    context: context,
                    img: data['p_imgs'][0],
                    qty: controller.quantity.value,
                    title: data['p_name'],
                    tprice: controller.totalPrice.value
                  );
                    VxToast.show(context, msg: "Added to Cart");
                },
                textColor: whiteColor,
                title: "Add to cart"
              ),
            )
          ],
        )
      ),
    );
  }
}
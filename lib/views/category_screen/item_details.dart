import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/widgets_common/our_button.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
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
                    itemCount: 2, 
                    itemBuilder: (context, index) {
                    return Image.asset(imgFc5,width: double.infinity,fit: BoxFit.cover,);
                  }),

                  10.heightBox,
                  //title and details section
                  title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  //rating
                  VxRating(onRatingUpdate: (value){},
                  normalColor: textfieldGrey,
                  selectionColor: lightGolden,
                  count: 5,
                  size: 25,stepInt: true,),

                  10.heightBox,
                  "₹209".text.size(24).color(Colors.redAccent).fontFamily(bold).make(),

                  10.heightBox,

                  Row(
                    children: [
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          5.heightBox,
                          "This is the product description".text.black.fontFamily(semibold).size(16).make(),
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
                                child: "Size :".text.size(18).color(textfieldGrey).make(),
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                                  "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                                  10.widthBox,
                                  "(0 available)".text.color(textfieldGrey).make(),
                                ],
                              ),

                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                        
                      

                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total :".text.size(18).color(textfieldGrey).make(),
                          ),
                          Row(
                            children: [
                              "₹ 0.00".text.color(Colors.redAccent).size(18).fontFamily(bold).make(),
                            ],
                          ),

                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.make(),

                  //discription more
                  10.heightBox,
                  "Description".text.size(18).color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  "This is the  full description of product like symptomssadasdasdasdadad".text.color(darkFontGrey).make(),
                  ],
              ),
            ),
            )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: Colors.red,
              onPress: (){},
              textColor: whiteColor,
              title: "Add to cart"
            ),
          )
        ],
      )
    );
  }
}
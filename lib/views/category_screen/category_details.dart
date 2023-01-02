import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/views/category_screen/item_details.dart';
import 'package:mobi_pharma/widgets_common/bg_widget.dart';
import 'package:mobi_pharma/consts/consts.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWiget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child:  Column(
            children: [ 
              10.heightBox,
              //items container
              Expanded(child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250, mainAxisSpacing: 8
              ,crossAxisSpacing: 8), 
              itemBuilder: (context,index){
                
                return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP5, 
                              width: 200, 
                              height: 150,
                              fit: BoxFit.cover,),
                             
                              10.heightBox,
                              "Himalaya cream".text.fontFamily(semibold).color(darkFontGrey).make(),
                              10.heightBox,
                            "₹220".text.color(grassColor).fontFamily(bold).size(16).make()
                    
                          ],
                        ).box.
                        white.
                        margin(const EdgeInsets.symmetric(horizontal: 4)).
                        roundedSM.outerShadowSm.padding(const EdgeInsets.all(12)).make().onTap(() {
                          Get.to(()=> const ItemDetails(title: "Dummy item"));
                        });

              }))
            ],
          ),
        ),
      )
    );
  }
}
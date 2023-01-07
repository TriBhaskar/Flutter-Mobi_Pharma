import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/services/firestore_services.dart';
import 'package:mobi_pharma/views/category_screen/item_details.dart';
import 'package:mobi_pharma/widgets_common/bg_widget.dart';
import 'package:mobi_pharma/consts/consts.dart';

import '../../widgets_common/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const CategoryDetails({super.key,required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    return bgWiget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getproducts(title),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return Center(
                child: loadingIndicator(),
              );
            }else if(snapshot.data!.docs.isEmpty){
              return Center(
                child: "No products found".text.color(darkFontGrey).make(),
              );
            }else{

              var data = snapshot.data!.docs;


              return Container(
          padding: const EdgeInsets.all(12),
          child:  Column(
            children: [ 
              10.heightBox,
              //items container
              Expanded(child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250, mainAxisSpacing: 8
              ,crossAxisSpacing: 8), 
              itemBuilder: (context,index){
                
                return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              data[index]['p_imgs'][0], 
                              width: 200, 
                              height: 150,
                              fit: BoxFit.cover,),
                             
                              10.heightBox,
                              "${data[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                              10.heightBox,
                              
                            "₹ ${data[index]['p_price']}".text.color(grassColor).fontFamily(bold).size(16).make()
                    
                          ],
                        ).box.
                        white.
                        margin(const EdgeInsets.symmetric(horizontal: 4)).
                        roundedSM.outerShadowSm.padding(const EdgeInsets.all(12)).make().onTap(() {
                          Get.to(()=> ItemDetails(title: "${data[index]['p_name']}", data:data[index]));
                        });

              }))
            ],
          ),
        );
            }
          },
          ),
      )
    );
  }
}
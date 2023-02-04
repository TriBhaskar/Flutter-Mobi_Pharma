import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/lists.dart';
import 'package:mobi_pharma/controllers/auth_controller.dart';
import 'package:mobi_pharma/controllers/profile_controller.dart';
import 'package:mobi_pharma/services/firestore_services.dart';
import 'package:mobi_pharma/views/auth_screen/login_screen.dart';
import 'package:mobi_pharma/views/orders_screen/orders_screen.dart';
import 'package:mobi_pharma/views/profile_screen/components/details_card.dart';
import 'package:mobi_pharma/views/profile_screen/edit_profile_screen.dart';
import 'package:mobi_pharma/views/wishlist_screen/wishlist_screen.dart';
import 'package:mobi_pharma/widgets_common/bg_widget.dart';
import 'package:mobi_pharma/widgets_common/loading_indicator.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProfileController());
    return bgWiget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(grassColor),
                ),
              );
            }else{
              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(
            children: [
            //edit profile button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.edit, color: darkGreen,)).onTap(() {
                  controller.nameController.text = data['name'];
                  Get.to(() => EditProfileScreen(data: data));
                 }),
            ),

            //users details section

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  data['imageUrl']==''?

                  Image.asset(imgProfile2, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                  :
                  Image.network(data['imageUrl'], width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                 
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "${data['name']}".text.fontFamily(bold).black.make(),
                      5.heightBox,
                      "${data['email']}".text.black.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: darkred,
                      )
                    ),
                    onPressed: ()async{
                      await Get.put(AuthController()).signoutMethod(context);
                      Get.offAll(()=> const LoginScreen());
                    },
                    child: logout.text.fontFamily(semibold).black.make(),)
                ],
              ),
            ),

            20.heightBox,

            FutureBuilder(
              future: FirestoreServices.getCounts(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(!snapshot.hasData){
                  return Center(child: loadingIndicator());
                }else{
                  // print(snapshot.data);
                  var countdata =  snapshot.data;
                return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                detailsCard(count: countdata[0].toString(),title: "in your cart", width: context.screenWidth/3.4),
                detailsCard(count: countdata[1].toString(),title: "in your wishlist", width: context.screenWidth/3.4),
                detailsCard(count: countdata[2].toString(),title: "your order", width: context.screenWidth/3.4),
              ],
            );
                }
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     detailsCard(count: data['cart_count'],title: "in your cart", width: context.screenWidth/3.4),
            //     detailsCard(count: data['wishlist_count'],title: "in your wishlist", width: context.screenWidth/3.4),
            //     detailsCard(count: data['order_count'],title: "your order", width: context.screenWidth/3.4),
            //   ],
            // ),

            //buttons section
            20.heightBox,

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: lightGrey,
                  );
                },
              itemCount: profileButtonsList.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  onTap: (){
                    switch (index){
                      case 0:
                      Get.to(()=>const OrdersScreen());
                      break;
                      case 1:
                      Get.to(()=>const WishlistScreen());
                      break;
                      case 2:
                      VxToast.show(context, msg: data['id']);
                      break;
                    }
                  },
                  leading: Image.asset(
                  profileButtonsIcon[index],
                  width: 22,),
                  title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                );
                },
                ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make(),
            ),

          ],
        ));
            }
          },
        )

      ),
    );
  }
}
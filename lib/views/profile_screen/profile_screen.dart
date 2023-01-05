import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/lists.dart';
import 'package:mobi_pharma/controllers/auth_controller.dart';
import 'package:mobi_pharma/views/auth_screen/login_screen.dart';
import 'package:mobi_pharma/views/profile_screen/components/details_card.dart';
import 'package:mobi_pharma/widgets_common/bg_widget.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWiget(
      child: Scaffold(
        body: SafeArea(child: Column(
          children: [
            //edit profile button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.edit, color: darkGreen,)).onTap(() { }),
            ),


            //users details section

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(imgProfile2, width: 120, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                 
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(bold).black.make(),
                      5.heightBox,
                      "simran.kokal@emmoo.com".text.black.make(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(count: "00",title: "in your cart", width: context.screenWidth/3.4),
                detailsCard(count: "00",title: "in your wishlist", width: context.screenWidth/3.4),
                detailsCard(count: "100",title: "your order", width: context.screenWidth/3.4),
              ],
            ),

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
                  leading: Image.asset(
                  profileButtonsIcon[index],
                  width: 22,),
                  title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                );
                },
                ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make(),
            ),

          ],
        )),
      )
    );
  }
}
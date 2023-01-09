import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/controllers/home_controller.dart';
import 'package:mobi_pharma/views/cart_screen/cart_screen.dart';
import 'package:mobi_pharma/views/category_screen/category_screen.dart';
import 'package:mobi_pharma/views/home_screen/home_screen.dart';
import 'package:mobi_pharma/views/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

// init home controller
var controller = Get.put(HomeController());
    var navbarItem =[
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26), label: account)
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(() =>  Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
          ],
        ),
        bottomNavigationBar: Obx(()=>
          BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: darkGreen,
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            items: navbarItem,
            onTap: ((value){
              controller.currentNavIndex.value = value;
            }),
            ),
        ),
      ),
    );
  }
}
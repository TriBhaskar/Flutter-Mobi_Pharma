import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobi_pharma/consts/lists.dart';
import 'package:mobi_pharma/widgets_common/home_buttons.dart';

import '../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              suffix: Icon(Icons.search),
              filled: true,
              fillColor: whiteColor,
              hintText: searchanything,
              hintStyle: TextStyle(color: textfieldGrey),
            ),
          ),
          ),


        10.heightBox,
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //swipers brands
          
              VxSwiper.builder(
                aspectRatio: 16/9,
                autoPlay: true,
                height: 150,
                enlargeCenterPage: true,
                itemCount: sliderList.length, 
                itemBuilder: (context,index){
                return Image.asset(sliderList[index],
                fit: BoxFit.fill,
                ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
              }),
          
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(2, (index) => homeButtons(
                  height: context.screenHeight*0.12,
                  width: context.screenWidth/2.5,
                  icon: index ==0? icTodaysDeal: icFlashDeal,
                  title: index ==0 ? todayDeal : flashsale,
                )),
              ),
          
              //2nd swiper
              10.heightBox,
              VxSwiper.builder(
                aspectRatio: 16/9,
                autoPlay: true,
                height: 150,
                enlargeCenterPage: true,
                itemCount: secondsliderList.length, 
                itemBuilder: (context,index){
                return Image.asset(secondsliderList[index],
                fit: BoxFit.fill,
                ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
              }),
          
              //category button
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(2, (index) => homeButtons(
                  height: context.screenHeight*0.12,
                  width: context.screenWidth/2.5,
                  icon: index == 0? icTopCategories: icWholeSale,
                  title: index ==0? topCategory: popularproducts
                )),
              ),
          
              //featured  categories
          
              10.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
                
            
            ],
            ),
          ),
        )

        ],
        )),
    );
  }
}
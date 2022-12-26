import 'package:mobi_pharma/consts/consts.dart';

Widget homeButtons({width,height,icon,String? title,onPress}){
  return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 25,),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ],
    ).box.rounded.white.size(width, height).shadowSm.make();
}
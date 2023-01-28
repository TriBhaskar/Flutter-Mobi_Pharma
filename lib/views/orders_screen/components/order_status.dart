import 'package:mobi_pharma/consts/consts.dart';

Widget orderStatus({icon,color,title,showDone}){
  return ListTile(
    leading: Icon(
      icon, 
      color: color,
      //Color.fromARGB(255, 255, 86, 64),
      ).box.border(color: color).roundedSM.padding(const EdgeInsets.all(4)).make(),

      trailing: SizedBox(
        height: 100,
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "$title".text.color(darkFontGrey).make(),
           showDone? const Icon(
            Icons.done, 
            color: Color.fromARGB(255, 255, 86, 64),
        ):Container(),
          ],
        ),
      ),
  );
}
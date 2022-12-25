import 'package:mobi_pharma/consts/consts.dart';

Widget bgWiget({Widget? child}){
  return Container(
    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.fill)),
    child: child,
  );
}
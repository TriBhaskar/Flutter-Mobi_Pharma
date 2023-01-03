import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    child: "Cart is Empty!".text.fontFamily(semibold).size(20).color(darkFontGrey).makeCentered(),
    );
  }
}
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/views/orders_screen/components/order_status.dart';

class OrdersDetails extends StatelessWidget {
  final dynamic data;
  const OrdersDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Order Details".text.fontFamily(semibold).make(),
      ),
      body: Column(
        children: [
          Column(
            children: [
              orderStatus(
                color: Colors.amber.shade800,icon: Icons.done, title: "Order placed", showDone: data['order_placed']
              ),
            ],
          )
        ],
      ),
    );
  }
}
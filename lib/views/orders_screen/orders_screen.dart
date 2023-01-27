import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/services/firestore_services.dart';
import 'package:mobi_pharma/views/orders_screen/components/order_status.dart';
import 'package:mobi_pharma/views/orders_screen/orders_details.dart';
import 'package:mobi_pharma/widgets_common/loading_indicator.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Orders".text.color(darkFontGrey).fontFamily(semibold).make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getAllOrders(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
           if(!snapshot.hasData){
            return Center(child: loadingIndicator(),);
           }else if(snapshot.data!.docs.isEmpty){
            return "No orders yet!".text.color(darkFontGrey).makeCentered();
           }else{
            var data =  snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: "${index+1}".text.fontFamily(bold).xl.make(),
                  tileColor: lightGrey,
                  title: data[index]['order_code'].toString().text.color(Colors.greenAccent).fontFamily(semibold).make(),
                  subtitle:"₹ ${data[index]['total_amount']}".toString().text.fontFamily(bold).make(),
                  trailing: IconButton
                  (onPressed: () {
                    Get.to(()=>OrdersDetails(data: data[index],));
                  }, 
                  icon:const Icon(
                    Icons.arrow_forward_ios_outlined,
                     color: darkFontGrey
                     )),
                );
              },);
           }
          }
        ),
    );
  }
}
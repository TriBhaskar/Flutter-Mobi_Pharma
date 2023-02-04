import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/services/firestore_services.dart';
import 'package:mobi_pharma/widgets_common/loading_indicator.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Wishlist".text.color(darkFontGrey).fontFamily(semibold).make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getWishlists(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
           if(!snapshot.hasData){
            return Center(child: loadingIndicator(),);
           }else if(snapshot.data!.docs.isEmpty){
            return "No wish yet!".text.color(darkFontGrey).makeCentered();
           }else{
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(
                          "${data[index]['p_imgs'][0]}",
                          width: 100,
                          height: 300,
                          fit: BoxFit.fill,
                          ),
                        title: "${data[index]['p_name']}"
                        .text.fontFamily(semibold)
                        .size(18)
                        .make(),
                        subtitle: "₹ ${data[index]['p_price']}".text.fontFamily(semibold).color(Colors.greenAccent).size(15).make(),
                        trailing: const Icon(
                          Icons.favorite, 
                          color: Colors.red,
                          ).onTap(() async{ 
                            await firestore.collection(productsCollection).doc(data[index].id).set({
                              'p_wishlist':FieldValue.arrayRemove([currentUser!.uid])
                            },SetOptions(merge: true));
                          }),
                        );
                    }),
                ),
              ],
            );
           }
          }
        ),
    );
  }
}
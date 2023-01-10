import 'package:get/get.dart';
import 'package:mobi_pharma/consts/consts.dart';
import 'package:mobi_pharma/controllers/cart_controller.dart';
import 'package:mobi_pharma/views/cart_screen/payment_method.dart';
import 'package:mobi_pharma/widgets_common/custom_textfield.dart';
import 'package:mobi_pharma/widgets_common/our_button.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: (){
            if(controller.addressController.text.length>10 && controller.cityController.text.length>2 && controller.stateController.text.length>2 && controller.postalcodeController.text.isNumericOnly && controller.phoneController.text.isNumericOnly ){
              Get.to(()=>const PaymentMethods());


            }else{
              VxToast.show(context, msg: "Please fill the above details correctly");
            }
          },
          color: Colors.red,
          textColor: whiteColor,
          title: "Continue"
          
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customTextField(hint: "Address",isPass: false,title: "Address",controller: controller.addressController),
            customTextField(hint: "City",isPass: false,title: "City",controller: controller.cityController),
            customTextField(hint: "State",isPass: false,title: "State",controller: controller.stateController),
            customTextField(hint: "Pincode",isPass: false,title: "Pincode",controller: controller.postalcodeController),
            customTextField(hint: "Mobile no",isPass: false,title: "Mobile no",controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}
import 'package:get/get.dart';
import 'package:mobi_pharma/consts/consts.dart';

class CartController extends GetxController {
  var totalP =0.obs; 
  
  //text controllers for shipping

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var phoneController = TextEditingController();
  var postalcodeController = TextEditingController();



  calculate(data){
    totalP.value = 0;
    for(var i =0; i< data.length; i++){
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }
}
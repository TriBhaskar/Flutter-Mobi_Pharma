import 'package:mobi_pharma/consts/consts.dart';

class FirestoreServices{
  //get users data
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }

  //get products according to category

  static getproducts(category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo: category).snapshots();
  }
}
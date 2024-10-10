import 'package:cloud_firestore/cloud_firestore.dart';
class FirebaseApi{
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  static Future<void> saveData({
    required String userName,
    required String password,
})async{
    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('test').add({
      'userName': userName,
      'password': password

    });

  }

}
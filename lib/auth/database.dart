import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getByName(String name) {}
  Upload(userMap) {
    FirebaseFirestore.instance.collection("user").add(userMap);
  }
}

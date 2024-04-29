import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class BmiServices {
  Future<void> addBmiData({required Map<String, dynamic> json}) async {
    await FirebaseFirestore.instance.collection("bmi data").add(json);
  }

  Future<void> delete(String docId) async {
    await FirebaseFirestore.instance.collection("bmi data").doc(docId).delete();
  }

  Future<void> update(
      {required String docId, required Map<String, dynamic> json}) async {
    await FirebaseFirestore.instance
        .collection("bmi data")
        .doc(docId)
        .update(json);
  }
}

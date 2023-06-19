import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/transation_models.dart' as models;

class TransationsMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<models.Transations> allTransations() async {
    QuerySnapshot<Map<String, dynamic>> documentSnapshot = await _firestore
        .collection('userdata')
        .doc(_auth.currentUser!.uid)
        .collection('alltransations')
        .get();

    return models.Transations.fromSnap(
        documentSnapshot as DocumentSnapshot<Object?>);
  }
}

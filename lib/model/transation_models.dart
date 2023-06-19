import 'package:cloud_firestore/cloud_firestore.dart';

class Transations {
  final String amount;
  final String name;
  final String paymentDateTime;
  final String count;

  Transations(
      {required this.amount,
      required this.name,
      required this.paymentDateTime,
      required this.count});

  static Transations fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Transations(
        amount: snapshot['amount'],
        name: snapshot['name'],
        count: snapshot['count'],
        paymentDateTime: snapshot['paymentDateTime']);
  }
}

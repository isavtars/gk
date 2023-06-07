

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gharkhracha/resources/storage_methods.dart';


class UserMethods {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> updateUserDate(
      {required String uid,
      required String fullName,
      required String phoneNumber,
      required String bankAccNumber,
      required String age,
      required String kyc,
      required String incomeRange,
      required Uint8List picfile}) async {
    String res = "Something is errors";

    String profilePic =
        await StorageMehods().uplodaImages('profilePicture', picfile);

    try {
      if (fullName.isNotEmpty ||
          phoneNumber.isNotEmpty ||
          bankAccNumber.isNotEmpty ||
          age.isNotEmpty ||
          kyc.isNotEmpty ||
          incomeRange.isNotEmpty ||
          picfile.isNotEmpty    
          ) {
        await _firestore.collection('users').doc(uid).update({
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'bankAccNumber': bankAccNumber,
          'age': age,
          'kyc': kyc,
          'incomeRange': incomeRange,
          'profilePic': profilePic,
        });
        res = "Success";
      } else {
        res = "Please Enter the all Feilds";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}

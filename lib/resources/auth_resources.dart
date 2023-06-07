import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_models.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //signup to the users
  //this is our methods
  Future<String> signUpUser(
      {required email, required password, required confirmPassword}) async {
    String res = "Something errors occures";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          confirmPassword.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        model.Users user = model.Users(
          email: email,
          uid: cred.user!.uid,
          fullName: "null",
          phoneNumber: "null",
          bankAccNumber: "null",
          age: "null",
          kyc: "null",
          incomeRange: "null",
          profilePic: "null",
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "Succes";
      } else {
        res = "Please Enter The all Feilds";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  //login

  Future<String> loginUsers(
      {required String email, required String password}) async {
    String res = 'Something Errors Occures';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Sucess";
      } else {
        res = "Enter all the feilds";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  //resetspasword
  Future<String> resetPassword({required String email}) async {
    String res = "Somrthing errors occures";
    try {
      await _auth.sendPasswordResetEmail(email: email);
      res = "Sucess";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//logouts
  Future<void> logout() async {
    _auth.signOut();
  }

  //geting all the users resources
  Future<model.Users> getuserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.Users.fromSnap(documentSnapshot);
  }

  //sending veriafaction email
  Future<void> sendVerifactionEmail() async {
    final users = _auth.currentUser!;
    await users
        .sendEmailVerification()
        .then((value) {})
        .onError((error, stackTrace) {});
  }

//checking emailVerifeid

  Future<String> verifierdEmail(
      {required bool verified, required String uid}) async {
    String res = "Something Errors occure";
    try {
      if (verified) {
        await _firestore.collection('usersdata').doc(uid).set({
          "amount": 0,
          'need': 0,
          'expenses': 0,
          'savings': 0,
          'totalBalance': 0,
          'needAvailableBalance': 0,
          'expensesAvailableBalance': 0,
          'count': 1,
          'isEFenabled': false,
          'isCPenabled': false,
          'isAutopayOn': false,
          'targetEmergencyFunds': 0,
          'collectedEmergencyFunds': 0,
        });
        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}

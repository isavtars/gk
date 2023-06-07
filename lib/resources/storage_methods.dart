import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class StorageMehods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //add image as firestore and downlod the url
  Future<String> uplodaImages(
      String childName, Uint8List file,) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

   

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downlodurl = await snap.ref.getDownloadURL();
    return downlodurl;
  }
}

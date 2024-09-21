import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editSettingsProvider =Provider((ref)=> EditSettingsField(firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance));

class EditSettingsField{
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  EditSettingsField({
    required this.firestore,
    required this.auth,
  });
  editDisplayName(username)async{
    await firestore.collection("users").doc(auth.currentUser!.uid).update({
      "username":username
    }
    );
  }
   edituserName(userEmail)async{
    await firestore.collection("users").doc(auth.currentUser!.uid).update({
      "email":userEmail
    }
    );
  }
   editDescription(description)async{
    await firestore.collection("users").doc(auth.currentUser!.uid).update({
      "description":description
    }
    );
  }
 


}
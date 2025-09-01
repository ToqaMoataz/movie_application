import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Models/user_model.dart';


class FirebaseManager {
  //Users//
  static CollectionReference<UserModel> usersCollection() {
    return FirebaseFirestore.instance.collection("Users").withConverter(
        fromFirestore: (snapshot, _) {
          return UserModel.fromJson(snapshot.data()!);
        },
        toFirestore: (model, _) {
          return model.toJson();
        }
    );
  }


}



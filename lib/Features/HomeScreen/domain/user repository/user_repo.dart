import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Core/Firebase/firebase_manager.dart';

import '../../../../Core/Models/user_model.dart';

abstract class UserRepo{
  Future<UserModel?> readCurrUser();
}

class UserRepoImp implements UserRepo{
  @override
  Future<UserModel?> readCurrUser() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      print("🔑 Current UID: $uid");

      final docRef = FirebaseManager.usersCollection().doc(uid);
      final snapshot = await docRef.get();

      // print("📄 Document exists: ${snapshot.exists}");
      final user = snapshot.data();

      if (user != null) {
        // print("📄 UserModel data: ${user.toJson()}");
        // print("🆔 User ID: ${user.id}");
      } else {
        // print("⚠️ snapshot.data() is null!");
      }
      print("useeeer:${user?.name}");
      return user;
    } on FirebaseAuthException catch (e) {
      print("🔥 FirebaseAuthException: $e");
      rethrow;
    }
  }



}
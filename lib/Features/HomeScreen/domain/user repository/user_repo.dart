import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/Core/Firebase/firebase_manager.dart';

import '../../../../Core/Models/user_model.dart';

abstract class UserRepo{
  Future<UserModel?> readCurrUser();

  Future<void> signOutUser();

}

class UserRepoImp implements UserRepo{
  @override
  Future<UserModel?> readCurrUser() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      print("🔑 Current UID: $uid");

      final docRef = FirebaseManager.usersCollection().doc(uid);
      final snapshot = await docRef.get();
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

  @override
  Future<void> signOutUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      GoogleSignIn _googleSignIn = GoogleSignIn();
      if (user == null) {
        print("❌ No user is signed in.");
        return;
      }

      bool isGoogleUser = user.providerData.any((provider) => provider.providerId == 'google.com');

      if (isGoogleUser) {
        print("🔑 Google account detected. Signing out from Google too...");
        await _googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
      print("✅ Signed out successfully.");

    } catch (e) {
      print("❌ Error during sign out: ${e.toString()}");
    }
  }

}
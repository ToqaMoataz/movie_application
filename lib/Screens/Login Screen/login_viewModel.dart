import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/Core/base.dart';
import 'package:movie_app/Screens/Login%20Screen/login_connector.dart';

import '../../Firebase/firebase_manager.dart';
import '../../Models/user_model.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {

  Future<void> signInWithGoogle() async {
    try {
      connector?.onLoading();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        connector?.onError("Google sign-in cancelled");
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user!;
      final userModel = UserModel(
        id: user.uid,
        name: user.displayName ?? "",
        email: user.email ?? "",
        phoneNumber: user.phoneNumber ?? "",
        image: user.photoURL ?? "",
      );

      final docRef = FirebaseManager.usersCollection().doc(user.uid);
      final snapshot = await docRef.get();

      if (!snapshot.exists) {
        await docRef.set(userModel);
      }

      connector?.goToHome();
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message ?? "");
    }
  }


  login({required String email,required String password})async{
    try {
      connector?.onLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      connector?.goToHome();
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message ?? "");
    }
  }

}
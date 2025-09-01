import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/Core/MVVM%20Base/base.dart';

import '../../../../Core/Firebase/firebase_manager.dart';
import '../../../../Core/Models/user_model.dart';
import 'login_connector.dart';
class LoginViewModel extends BaseViewModel<LoginConnector> {

  Future<void> signInWithGoogle() async {
    try {
      connector?.onLoading();

      final userModel = await repo.signInWithGoogle();

      if (userModel == null) {
        connector?.onError("Google sign-in cancelled");
        return;
      }

      connector?.goToHome();
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message ?? "Something went wrong");
    }
  }


  login({required String email,required String password})async{
    try {
      connector?.onLoading();
      await repo.login(email: email, password: password);
      connector?.goToHome();
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message ?? "");
    }
  }

}
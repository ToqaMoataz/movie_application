import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/Core/MVVM%20Base%20Class/base.dart';
import '../../../../Core/Firebase/firebase_manager.dart';
import 'login_connector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {

  Future<void> signInWithGoogle() async {
    try {
      connector?.onLoading();

      final user = await repo.signInWithGoogle();

      if (user == null) {
        connector?.onError("Google sign-in cancelled");
        return;
      }

      connector?.goToHome();
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message??"");
    } catch (e) {
      connector?.onError(e.toString());
    }
  }


  Future<void> login({required String email,required String password})async{
    try {
      connector?.onLoading();
      await repo.login(email: email, password: password);
      connector?.goToHome();
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message??"");
    } catch (e) {
      connector?.onError(e.toString());
    }
  }

}
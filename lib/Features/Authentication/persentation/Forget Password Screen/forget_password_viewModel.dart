import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Core/MVVM%20Base/base.dart';
import 'forget_password_connector.dart';

class ForgetPasswordViewModel extends BaseViewModel<ForgetPasswordConnector>{
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      connector?.onLoading();
      await repo.sendPasswordResetEmail(email);
      connector?.goToSignIn(message: "Password reset email sent successfully.");
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message ?? "An error occurred");
    }
  }

}
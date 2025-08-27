import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Core/base.dart';
import 'package:movie_app/Screens/Forget%20Password%20Screen/forget_password_connector.dart';

class ForgetPasswordViewModel extends BaseViewModel<ForgetPasswordConnector>{
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      // connector?.onLoading();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      connector?.goToSignIn(message: "Password reset email sent successfully.");
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message ?? "An error occurred");
    }
  }

}
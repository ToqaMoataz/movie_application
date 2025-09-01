import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Core/MVVM%20Base/base.dart';
import 'package:movie_app/Features/Authentication/persentation/Regiser%20Screen/register_connector.dart';

import '../../../../Core/Models/user_model.dart';


class RegisterViewModel extends BaseViewModel<RegisterConnector>{


  register({required UserModel user, required String password})async{
    try {
      connector?.onLoading();
     await repo.register(user: user, password: password);
      connector?.goToSignIn();
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message??"");
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}
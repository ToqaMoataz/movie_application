import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Core/MVVM%20Base%20Class/base.dart';
import 'package:movie_app/Features/Authentication/persentation/Regiser%20Screen/register_connector.dart';

import '../../../../Core/Firebase/firebase_manager.dart';
import '../../../../Core/Models/user_model.dart';


class RegisterViewModel extends BaseViewModel<RegisterConnector>{

  Future<void> register({required UserModel user, required String password})async{
    try {
      connector?.onLoading();
      repo.register(user: user, password: password);
      connector?.goToSignIn();
    } on FirebaseAuthException catch (e) {
      connector?.onError(e.message??"");
    } catch (e) {
      connector?.onError(e.toString());
    }
  }

}
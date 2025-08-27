import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Core/base.dart';
import 'package:movie_app/Firebase/firebase_manager.dart';
import 'package:movie_app/Screens/Regiser%20Screen/register_connector.dart';

import '../../Models/user_model.dart';

class RegisterViewModel extends BaseViewModel<RegisterConnector>{

  Future<void> addUser(UserModel user) async{
    //usersCollection().add(user);
    var snapshot=FirebaseManager.usersCollection().doc(user.id);
    user.id=snapshot.id;
    await snapshot.set(user);
  }

  register({required UserModel user, required String password})async{
    try {
      connector?.onLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      //credential.user!.sendEmailVerification();
      user.id=credential.user!.uid;
      await addUser(user);
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
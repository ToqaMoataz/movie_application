import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Core/Firebase/firebase_manager.dart';

abstract class UpdateProfileRepo{
  Future<void> updateUserData({required String name, required String phoneNumber, required String image,});
  Future<void> deleteUser();
}

class UpdateProfileRepoImp extends UpdateProfileRepo{

  @override
  Future<void> updateUserData({required String name, required String phoneNumber, required String image,}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print("No user is currently logged in");
        return;
      }

      final doc = await FirebaseManager.usersCollection().doc(user.uid).get();
      if (!doc.exists) {
        print("User not found in Firestore");
        return;
      }

      final currentUser = doc.data()!;

      final bool nameIsChanged = currentUser.name != name;
      final bool phoneIsChanged = currentUser.phoneNumber != phoneNumber;
      final bool imageIsChanged = currentUser.image != image;

      if (nameIsChanged || phoneIsChanged || imageIsChanged) {
        await FirebaseManager.usersCollection().doc(user.uid).update({
          'name': name,
          'phoneNumber': phoneNumber,
          'image': image,
        });
      } else {
        return; // No update needed
      }
    } on FirebaseException catch (e) {
      throw Exception("Failed to update user: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }


  @override
  Future<void> deleteUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("No user is currently logged in");
      return;
    }
    await FirebaseFirestore.instance.collection("Users").doc(user.uid).delete();
    await user.delete();
  }

}
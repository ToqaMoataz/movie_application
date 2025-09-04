import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/HomeScreen/domain/user%20repository/user_repo.dart';
import 'package:movie_app/Features/Update%20and%20Delete%20profile/domail/update_profile_repo.dart';
import 'package:movie_app/Features/Update%20and%20Delete%20profile/persentation/update%20and%20delete%20cubit/states.dart';

import '../../../../Core/Models/user_model.dart';
import '../../../Authentication/persentation/Login Screen/login_screen.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UserRepo userRepo;
  UpdateProfileRepo repo;
  UpdateProfileCubit(this.repo,this.userRepo) : super(UpdateProfileInitState());
  static UpdateProfileCubit get(context) => BlocProvider.of<UpdateProfileCubit>(context);

  void showImagesDialog(bool show) {
    emit(state.copyWith(showDialog: show));
  }

  void setSelectedImage(String imageName){
    emit(state.copyWith(selectedImage: imageName));
  }
  void getUserImage(UserModel user){
    emit(state.copyWith(selectedImage: user.image));
  }

  Future<void> updateUser(String name,String phoneNumber,String imageName)async{
    try {
      emit(state.copyWith(updateProfileRequestState: RequestState.loading));
      await repo.updateUserData(name: name, phoneNumber: phoneNumber,image: imageName);
      emit(state.copyWith(updateProfileRequestState: RequestState.success));

    } catch (e) {
      emit(state.copyWith(
        updateProfileRequestState: RequestState.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> deleteUser() async {
    try {
      emit(state.copyWith(deleteProfileRequestState: RequestState.loading));
      await repo.deleteUser();
      emit(state.copyWith(deleteProfileRequestState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(
        deleteProfileRequestState: RequestState.error,
        errorMessage: e.toString(),
      ));
    }
  }


}

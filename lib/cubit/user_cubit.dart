import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_food/models/models.dart';
import 'package:infinit_food/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(user: result.value));
    } else {
      emit(UserLoadingFailed(message: result.massage));
    }
  }

  Future<void> signUp(User user, String password, {File pictureFile}) async {
    ApiReturnValue<User> result = await UserServices.signUp(user, password, pictureFile: pictureFile);

    if (result.massage == null) {
      emit(UserLoaded(user: result.value));
    } else {
      emit(UserLoadingFailed(message: result.massage));
    }
  }

  Future<void> uploadFoto({File pictureFile}) async {
    ApiReturnValue<String> result = await UserServices.uploadProfilePicture(pictureFile) as ApiReturnValue<String>;

    if (result != null) {
      emit(
        UserLoaded(
          user: (state as UserLoaded).user.copyWith(picturePath: 'http://foodmarket-backend.buildwithangga.id/storage/' + result.value),
        ),
      );
    } else {
      emit(UserLoadingFailed(message: result.massage));
    }
  }
}

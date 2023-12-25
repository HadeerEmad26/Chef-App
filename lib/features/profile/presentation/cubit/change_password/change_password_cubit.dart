import 'package:chef_app/features/profile/data/reposetry/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.profileRepo) : super(ChangePasswordInitial());

  final ProfileRepository profileRepo;

  GlobalKey<FormState> oldPasswordKey = GlobalKey<FormState>();
  GlobalKey<FormState> newPasswordKey = GlobalKey<FormState>();
  GlobalKey<FormState> confirmNewPasswordKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController changeNewPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isNewPasswordShowing = true;
  IconData newPasswordSuffixIcon = Icons.visibility;
  void changeNewPasswordSuffixIcon() {
    isNewPasswordShowing = !isNewPasswordShowing;
    newPasswordSuffixIcon =
    isNewPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  //!!!confirm password text form field
  bool isConfirmPasswordShowing = true;
  IconData confirmPasswordSuffixIcon = Icons.visibility;
  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordShowing = !isConfirmPasswordShowing;
    confirmPasswordSuffixIcon =
    isConfirmPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }




  bool isOldPasswordShowing = true;
  IconData oldPasswordSuffixIcon = Icons.visibility;
  void changeOldPasswordSuffixIcon() {
    isOldPasswordShowing = !isOldPasswordShowing;
    oldPasswordSuffixIcon =
    isOldPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeOldPasswordSuffixIcon());
  }



  void newPassword() async {
    emit(NewPasswordLoadingState());
    final result = await profileRepo.changeOldPassword(
        oldPassword: oldPasswordController.text,
        newPassword: changeNewPasswordController.text,
        confirmNewPassword: confirmPasswordController.text);
    result.fold((l) => emit(NewPasswordErrorState(l)),
            (r) => emit(NewPasswordSuccessState(r)));
  }




}





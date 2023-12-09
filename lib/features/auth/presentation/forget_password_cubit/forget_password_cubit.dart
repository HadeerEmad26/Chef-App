import 'package:chef_app/features/auth/data/reposetry/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepository authRepo;

  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  void sendCode() async {
    emit(SendCodeLoading());
    final result = await authRepo.sendCode(emailController.text);
    result.fold((l) => emit(SendCodeError(l)), (r) => emit(SendCodeSuccess(r)));
  }
  //!!reset password logic
  //!!!new password text form field
  //GlobalKey<FormState> resetPasswordKey =GlobalKey<FormState>();

  TextEditingController newPasswordController = TextEditingController();
  bool isNewPasswordShowing = true;
  IconData newPasswordSuffixIcon = Icons.visibility;
  void changeNewPasswordSuffixIcon() {
    isNewPasswordShowing = !isNewPasswordShowing;
    newPasswordSuffixIcon =
        isNewPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  //!!!confirm password text form field
  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordShowing = true;
  IconData confirmPasswordSuffixIcon = Icons.visibility;
  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordShowing = !isConfirmPasswordShowing;
    confirmPasswordSuffixIcon =
        isConfirmPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

//!!! code
  TextEditingController codeController = TextEditingController();

  //!!!! method change password & send & recives & confirm code,email
  void resetPassword() async {
    emit(ResetPasswordLoadingState());
    final result = await authRepo.resetPassword(
        email: emailController.text,
        password: newPasswordController.text,
        confirmPassword: confirmPasswordController.text,
        code: codeController.text);
    result.fold((l) => emit(ResetPasswordErrorState(l)),
            (r) => emit(ResetPasswordSuccesState(r)));
  }
}

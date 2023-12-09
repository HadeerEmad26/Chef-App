abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ChangeNewPasswordSuffixIcon extends ForgetPasswordState{}

class ChangeConfirmPasswordSuffixIcon extends ForgetPasswordState{}


class SendCodeLoading extends ForgetPasswordState {}
class SendCodeSuccess extends ForgetPasswordState {
  final String message;

  SendCodeSuccess(this.message);

}
class SendCodeError extends ForgetPasswordState {
  final String message;
  SendCodeError(this.message);
}


class ResetPasswordLoadingState extends ForgetPasswordState {}
class ResetPasswordSuccesState extends ForgetPasswordState {
  final String message;

  ResetPasswordSuccesState(this.message);

}
class ResetPasswordErrorState extends ForgetPasswordState {
  final String message;
  ResetPasswordErrorState(this.message);
}

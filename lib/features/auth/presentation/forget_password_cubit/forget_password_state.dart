abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class SendCodeLoading extends ForgetPasswordState {}
class SendCodeSuccess extends ForgetPasswordState {
  final String message;

  SendCodeSuccess(this.message);

}
class SendCodeError extends ForgetPasswordState {
  final String message;
  SendCodeError(this.message);
}

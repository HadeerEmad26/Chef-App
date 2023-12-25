abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {
  final String message;

  ChangePasswordSuccessState(this.message);

}

class ChangePasswordErrorState extends ChangePasswordState {
  final String message;

  ChangePasswordErrorState(this.message);

}


class ChangeNewPasswordSuffixIcon extends ChangePasswordState {}

class ChangeConfirmPasswordSuffixIcon extends ChangePasswordState {}

class ChangeOldPasswordSuffixIcon extends ChangePasswordState {}



class NewPasswordLoadingState extends ChangePasswordState {

}
class NewPasswordSuccessState extends ChangePasswordState {
  final String message;

  NewPasswordSuccessState(this.message);

}
class NewPasswordErrorState extends ChangePasswordState {
  final String message;

  NewPasswordErrorState(this.message);

}





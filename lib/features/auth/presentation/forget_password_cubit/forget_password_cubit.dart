
import 'package:chef_app/features/auth/data/reposetry/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepo authRepo;


  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  void sendCode() async{
    emit(SendCodeLoading());
    final result= await authRepo.sendCode(emailController.text);
    result.fold((l) => emit(SendCodeError(l)), (r) => emit(SendCodeSuccess(r)));
  }



}

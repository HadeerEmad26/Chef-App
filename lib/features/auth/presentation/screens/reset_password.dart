import 'package:chef_app/core/local/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../forget_password_cubit/forget_password_cubit.dart';
import '../forget_password_cubit/forget_password_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateReplacement(context: context, route: Routes.sendCode);
        }, icon: const Icon(Icons.arrow_back)),
        title: Text(
          AppStrings.createYourNewPassword.tr(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccesState) {
                //Show message
                showToast(message: state.message, state: ToastStates.success);
                //Navigate to login screen
                navigateReplacement(context: context, route: Routes.login);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context)
                    .resetPasswordKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40.h, bottom: 24.h),
                        child: const CustomImage(imagePath: AppAssets.lock),
                      ),
                      Text(
                        AppStrings.createYourNewPassword.tr(context),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),

                      //!!password
                      CustomTextFormField(
                        controller:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .newPasswordController,
                        hint: AppStrings.newPassword.tr(context),
                        isPassword:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .isNewPasswordShowing,
                        icon: BlocProvider.of<ForgetPasswordCubit>(context)
                            .newPasswordSuffixIcon,
                        suffixIconOnPressed: () {
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .changeNewPasswordSuffixIcon();
                        },
                        validate: (data) {
                          if (data!.length < 6 || data.isEmpty) {
                            return AppStrings.pleaseEnterValidPassword
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      //!!confirm password
                      CustomTextFormField(
                        controller:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .confirmPasswordController,
                        hint: AppStrings.confirmPassword.tr(context),
                        isPassword:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .isConfirmPasswordShowing,
                        icon: BlocProvider.of<ForgetPasswordCubit>(context)
                            .confirmPasswordSuffixIcon,
                        suffixIconOnPressed: () {
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .changeConfirmPasswordSuffixIcon();
                        },
                        validate: (data) {
                          if (data!.length < 6 || data.isEmpty) {
                            return AppStrings.pleaseEnterValidPassword
                                .tr(context);
                          }

                          if (data !=
                              BlocProvider.of<ForgetPasswordCubit>(context)
                                  .newPasswordController
                                  .text) {
                            return AppStrings.pleaseEnterValidPassword
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      //!!!send code
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        controller:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .codeController,
                        hint: AppStrings.code.tr(context),
                        validate: (data) {
                          //123h ==> null
                          //123 ==> true & return 123
                          if(num.tryParse(data!)== null){
                            return AppStrings.pleaseEnterValidCode.tr(context);
                          }
                          if (data.isEmpty) {
                            return AppStrings.pleaseEnterValidCode.tr(context);
                          }
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 26.h,
                      ),
                      state is ResetPasswordLoadingState
                          ? const CustomLoadingIndicator()
                          : CustomButton(
                              onPressed: () {
                                if (BlocProvider.of<ForgetPasswordCubit>(
                                        context)
                                    .resetPasswordKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<ForgetPasswordCubit>(context)
                                      .resetPassword();
                                }
                              },
                              text: AppStrings.confirmPassword.tr(context),
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

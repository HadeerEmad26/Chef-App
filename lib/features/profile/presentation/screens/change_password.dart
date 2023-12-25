import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/features/auth/presentation/forget_password_cubit/forget_password_cubit.dart';
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
import '../cubit/change_password/change_password_cubit.dart';
import '../cubit/change_password/change_password_state.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateReplacement(context: context, route: Routes.home);
        }, icon: const Icon(Icons.arrow_back)),
        title: Text(
          AppStrings.changePassword.tr(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) {
              if (state is ChangePasswordSuccessState) {
                //Show message
                showToast(message: state.message, state: ToastStates.success);
                //Navigate to login screen
                navigateReplacement(context: context, route: Routes.login);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ChangePasswordCubit>(context)
                    .oldPasswordKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40.h, bottom: 24.h),
                        child: const CustomImage(imagePath: AppAssets.lock),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppStrings.changePassword.tr(context),
                        ),
                      ),

                      SizedBox(
                        height: 26.h,
                      ),

                      //!! old password
                      CustomTextFormField(
                        controller:
                        BlocProvider.of<ChangePasswordCubit>(context)
                            .oldPasswordController,
                        hint: AppStrings.oldPassword.tr(context),
                        isPassword:
                        BlocProvider.of<ChangePasswordCubit>(context)
                            .isOldPasswordShowing,
                        icon: BlocProvider.of<ChangePasswordCubit>(context)
                            .oldPasswordSuffixIcon,
                        suffixIconOnPressed: () {
                          BlocProvider.of<ChangePasswordCubit>(context)
                              .changeOldPasswordSuffixIcon();
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

                      // //!!new password
                      CustomTextFormField(
                        controller:
                        BlocProvider.of<ChangePasswordCubit>(context)
                            .changeNewPasswordController,
                        hint: AppStrings.newPassword.tr(context),
                        isPassword:
                        BlocProvider.of<ChangePasswordCubit>(context)
                            .isNewPasswordShowing,
                        icon: BlocProvider.of<ChangePasswordCubit>(context)
                            .newPasswordSuffixIcon,
                        suffixIconOnPressed: () {
                          BlocProvider.of<ChangePasswordCubit>(context)
                              .changeNewPasswordSuffixIcon();
                        },
                        validate: (data) {
                          if (data!.length < 6 || data.isEmpty) {
                            return AppStrings.pleaseEnterValidPassword
                                .tr(context);
                          }

                          if (data !=
                              BlocProvider.of<ChangePasswordCubit>(context)
                                  .changeNewPasswordController
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

                      // //!!!confirm new password
                      CustomTextFormField(
                        controller:
                        BlocProvider.of<ChangePasswordCubit>(context)
                            .confirmPasswordController,
                        hint: AppStrings.confirmPassword.tr(context),
                        isPassword:
                        BlocProvider.of<ChangePasswordCubit>(context)
                            .isConfirmPasswordShowing,
                        icon: BlocProvider.of<ChangePasswordCubit>(context)
                            .confirmPasswordSuffixIcon,
                        suffixIconOnPressed: () {
                          BlocProvider.of<ChangePasswordCubit>(context)
                              .changeConfirmPasswordSuffixIcon();
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
                      state is ChangePasswordLoadingState
                          ? const CustomLoadingIndicator()
                          : CustomButton(
                        onPressed: () {
                          if (BlocProvider.of<ForgetPasswordCubit>(context)
                              .resetPasswordKey.currentState!.validate())
                          {
                            BlocProvider.of<ChangePasswordCubit>(context)
                                .newPassword();
                          }
                          navigateReplacement(context: context, route: Routes.home);
                          showToast(message: AppStrings.passwordChangedSucessfully, state: ToastStates.success);
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





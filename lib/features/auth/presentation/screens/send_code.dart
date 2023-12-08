import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/presentation/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.forgetPassword.tr(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 24.h),
                      child: CustomImage(imagePath: AppAssets.lock),
                    ),
                    Text(AppStrings.sendResetLinkInfo.tr(context),),
                    SizedBox(height: 26.h,),
                    CustomTextFormField(controller: TextEditingController(),
                      hint: AppStrings.email.tr(context),),
                    SizedBox(height: 26.h,),
                    state is SendCodeLoading?CustomLoadingIndicator():CustomButton(
                      onPressed: () {
                        if(BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey.currentState!.validate()){
                          BlocProvider.of<ForgetPasswordCubit>(context).sendCode();
                        }
                      },
                      text: AppStrings.sendResetLink.tr(context),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

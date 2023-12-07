import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_form_field.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CustomImage(
                    imagePath: AppAssets.backgroundTwo,
                    width: double.infinity,
                  ),
                  Center(
                    child: Text(
                      AppStrings.welcomeBack.tr(context),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    //email
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hint: AppStrings.email.tr(context),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hint: AppStrings.password.tr(context),
                      isPassword: true,
                      icon: Icons.remove_red_eye,
                      suffixIconOnPressed: () {},
                      validator: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.forgetPassword.tr(context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: AppStrings.signIn.tr(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

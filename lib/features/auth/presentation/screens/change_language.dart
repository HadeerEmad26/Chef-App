import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/commens.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            //backgroundImage
            const CustomImage(
              imagePath: AppAssets.background,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 116.h,
                  ),
                  CustomImage(
                    imagePath: AppAssets.appLogo,
                    height: 120.h,
                    width: 120.w,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(AppStrings.welcomeToChefApp.tr(context),
                      style: Theme.of(context).textTheme.displayLarge),
                  SizedBox(
                    height: 54.h,
                  ),
                  Text(AppStrings.pleaseChooseYourLanguage.tr(context),
                      style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(
                    height: 120.h,
                  ),
                  BlocBuilder<GlobalCubit, GlobalState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          CustomButton(
                            onPressed: () {
                              BlocProvider.of<GlobalCubit>(context).changeLang('en');
                              navigate(context: context, route: Routes.login);
                            },
                            text: 'English',
                            width: 140,
                            background: AppColors.black,
                          ),
                          const Spacer(),
                          CustomButton(
                            onPressed: () {
                              BlocProvider.of<GlobalCubit>(context).changeLang('ar');
                              navigate(context: context, route: Routes.login);
                            },
                            text: 'العربيه',
                            width: 140,
                            background: AppColors.black,
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

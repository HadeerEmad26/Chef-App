import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_color.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/commens.dart';
import '../../../../core/widgets/custom_file_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              profileCubit.profileImage == null ? CircleAvatar(
                radius: 75.r,
                backgroundImage: AssetImage(AppAssets.profile),
              ) : CustomFileImage(
                image: profileCubit.profileImage,
              ),

              SizedBox(height: 14.h,),


               Text(profileCubit.nameController.text,),


              SizedBox(height: 14.h,),

               Text("shahyemad080@gmail.com",
              style: Theme.of(context).textTheme.bodySmall),

              SizedBox(height: 30.h,),
              Row(
                children: [
                  const Icon(Icons.person_2_outlined,color: AppColors.primary,),
                  SizedBox(width: 16.w,),
                  TextButton(
                    onPressed: () {
                      navigate(context: context, route: Routes.updateProfile);
                    },
                    child: Text(AppStrings.editProfile.tr(context), style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        fontSize: 17.sp
                    ),),
                  ),
                ],
              ),

              // Row(
              //   children: [
              //     const Icon(Icons.visibility_off_outlined),
              //     SizedBox(width: 16.w,),
              //     TextButton(
              //         onPressed: () {
              //           navigate(
              //               context: context, route: Routes.changePassword);
              //         },
              //         child: Text(AppStrings.password.tr(context), style: Theme
              //             .of(context)
              //             .textTheme
              //             .bodySmall!
              //             .copyWith(
              //             fontSize: 17.sp
              //         ),)
              //     ),
              //   ],
              // ),

              Row(
                children: [
                  const Icon(Icons.settings_outlined,color: AppColors.primary,),
                  SizedBox(width: 16.w,),
                  TextButton(
                    child: Text(AppStrings.settings.tr(context), style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        fontSize: 17.sp
                    ),),
                    onPressed: () {
                      navigate(context: context, route: Routes.settings);
                    },

                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.logout_outlined,
                    color: AppColors.red,),
                  SizedBox(width: 16.w,),
                  TextButton(
                    onPressed: () {
                      navigateReplacement(
                          context: context, route: Routes.changeLang);
                      showToast(message: AppStrings.logoutSucessfully, state: ToastStates.success);
                    }, child: Text(AppStrings.logout.tr(context), style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: AppColors.red,
                      fontSize: 17.sp
                  ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/utils/app_color.dart';
import 'package:chef_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:chef_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_file_image.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/image_picker_dialog.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateReplacement(context: context, route: Routes.home);
        }, icon: const Icon(Icons.arrow_back)),
        title: Text(
          AppStrings.editProfile.tr(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Center(
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is EditProfileSuccessState) {
                  showToast(
                    message: AppStrings.profileEditedSuccessfully.tr(context),
                    state: ToastStates.success,
                  );
                  Navigator.pop(context);
                  BlocProvider.of<ProfileCubit>(context);
                }
              },
              builder: (context, state) {
                final profileCubit = BlocProvider.of<ProfileCubit>(context);
                return Form(
                  key: profileCubit.editProfileKey,
                  child: Column(
                    children: [
                      //!! add photo of .meal
                      Stack(
                        children: [
                          profileCubit.profileImage== null ?CircleAvatar(
                            radius: 75.r,
                            backgroundImage: AssetImage(AppAssets.profile),
                          ):CustomFileImage(
                            image: profileCubit.profileImage,
                          ),

                          Positioned.directional(
                            textDirection: Directionality.of(context),
                            bottom: -8,
                            end: -8,
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ImagePickerDialog(
                                      cameraOnTap: () {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.camera).then(
                                                (value) => profileCubit.takeImage(value));
                                      },
                                      galleryOnTap: () {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.gallery).then(
                                                (value) => profileCubit.takeImage(value));
                                      },
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.add,
                                color: AppColors.red,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //!! name text field
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        controller: profileCubit.nameController,
                        hint: AppStrings.name.tr(context),
                      ),
                      //!! price text field
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        controller: profileCubit.phoneController,
                        hint: AppStrings.phoneNumber.tr(context),
                        keyboardType: TextInputType.phone,
                      ),
                      //!! description text field
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: profileCubit.brandNameController,
                        hint: AppStrings.brandName.tr(context),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      CustomTextFormField(
                        controller: profileCubit.minimumChargeController,
                        hint: AppStrings.minimumCharge.tr(context),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: profileCubit.descriptionController,
                        hint: AppStrings.description.tr(context),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: profileCubit.locationController,
                        hint: AppStrings.location.tr(context),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      state is EditProfileLoadingState
                          ? const CustomLoadingIndicator()
                          : CustomButton(
                        onPressed: () {
                          if (profileCubit.editProfileKey.currentState!
                              .validate()) {
                            profileCubit.updateProfile();
                          }
                        },
                        text: AppStrings.update.tr(context),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

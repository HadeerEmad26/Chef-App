import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_color.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commens.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/image_picker_dialog.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.addDishToMenu.tr(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Center(
            child: BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                final menuCubit = BlocProvider.of<MenuCubit>(context);
                return Form(
                  key: menuCubit.addToMenuKey,
                  child: Column(
                    children: [
                      //!! add photo of meal
                      Stack(
                        children: [
                          CustomImage(imagePath: AppAssets.imagePacker),
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
                                        pickImage(ImageSource.camera)
                                            .then((value) => null);
                                      },
                                      galleryOnTap: () {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.gallery)
                                            .then((value) => null);
                                      },
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //!! name text field
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        controller: menuCubit.mealNameController,
                        hint: AppStrings.mealName.tr(context),
                        validate: (data) {
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealName
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      //!! price text field
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        controller: menuCubit.mealPriceController,
                        hint: AppStrings.mealPrice.tr(context),
                        validate: (data) {
                          if (num.tryParse(data!) == null) {
                            return AppStrings.pleaseEnterValidMealPrice
                                .tr(context);
                          }
                          if (data.isEmpty) {
                            return AppStrings.pleaseEnterValidMealPrice
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      //!! description text field
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: menuCubit.mealDescriptionController,
                        hint: AppStrings.mealDesc.tr(context),
                        validate: (data) {
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealDesc
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h,),
                      //!! category menu item
                      Container(
                        height: 75.h,
                        width: double.infinity,
                        child: DropdownButton(
                          isExpanded: true,
                          value: menuCubit.selectedItem,
                          hint: Text(AppStrings.category.tr(context)),
                          items: menuCubit.categoryList
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ),
                              )
                              .toList(),
                          onChanged: (data) {
                            menuCubit.changeItem(data);
                          },
                        ),
                      ),
                      //!! quantity or number
                      Row(
                        children: [
                          //!! quantity
                          Row(
                            children: [
                              Radio(
                                activeColor: AppColors.primary,
                                value: "quantity",
                                groupValue: menuCubit.groupValue,
                                onChanged: (value){
                                  menuCubit.changeGroupValue(value);
                                },),
                              Text(AppStrings.mealQuantity.tr(context)),
                            ],
                          ),
                          Spacer(),
                          //!! number
                          Row(
                            children: [
                              Radio(
                                activeColor: AppColors.primary,
                                value: "number",
                                groupValue: menuCubit.groupValue,
                                onChanged: (value){
                                  menuCubit.changeGroupValue(value);
                                },),
                              Text(AppStrings.mealNumber.tr(context)),
                            ],
                          ),
                        ],
                      ),
                      //!! add meal to menu button
                      //add to menu button
                      SizedBox(height: 16.h),
                      CustomButton(
                        onPressed: () {
                          // if (menuCubit.addToMenuKey.currentState!
                          //     .validate()) {
                          //   menuCubit.addDishToMenu();
                          // }
                        },
                        text: AppStrings.addToMenu.tr(context),
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

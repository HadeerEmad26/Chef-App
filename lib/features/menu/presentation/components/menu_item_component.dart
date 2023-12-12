import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/features/menu/data/models/meal_model.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';

class MenuItemComponent extends StatelessWidget {
  const MenuItemComponent({
    super.key, required this.mealModel,
  });

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image
        SizedBox(
          height: 75.h,
          width: 75.w,
          child: CustomCachedNetworkImage(
            imageUrl: mealModel.images[0],
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mealModel.name),
            // SizedBox(
            //   width: 180.w,
            //     child: Text(mealModel.description,
            //     overflow: TextOverflow.ellipsis,),
            //     ),

            Container(
            constraints: BoxConstraints(
              maxWidth: 165.w
            ),
              child: Text(mealModel.description,
                overflow: TextOverflow.ellipsis,
              ),
                ),


            Text(mealModel.price.toString()+AppStrings.le.tr(context)),
            Text(mealModel.category),
          ],
        ),
        Spacer(),
        BlocConsumer<MenuCubit, MenuState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        message: AppStrings.deleteMeal.tr(context),
                        confirmAction: () {
                          BlocProvider.of<MenuCubit>(context).
                          deleteDish(mealModel.id);
                          Navigator.pop(context);
                        },
                      );
                    });
              },
              icon: Icon(
                Icons.cancel,
                color: AppColors.red,
                size: 40,
              ),
            );
          }, listener: (BuildContext context, MenuState state) {
            if(state is DeleteDishSuccessState){
              BlocProvider.of<MenuCubit>(context).getAllMeals();
            }
        },
        )
      ],
    );
  }
}


import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';

class MenuItemComponent extends StatelessWidget {
  const MenuItemComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image
        SizedBox(
          height: 75.h,
          width: 75.w,
          child: CustomCachedNetworkImage(
            imageUrl:
                'https://www.diabetesfoodhub.org/system/user_files/Images/1837-diabetic-pecan-crusted-chicken-breast_JulAug20DF_clean-simple_061720.jpg',
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title'),
            Text('SubTitle'),
            Text('Price LE'),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    message: AppStrings.deleteMeal.tr(context),
                    confirmAction: () {},
                  );
                });
          },
          icon: Icon(
            Icons.cancel,
            color: AppColors.red,
            size: 40,
          ),
        )
      ],
    );
  }
}


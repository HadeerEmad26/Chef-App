import 'package:chef_app/core/local/app_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_strings.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key, required this.message, required this.confirmAction,
  });

  final String message;
  final VoidCallback confirmAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //content
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: AppColors.black),
      ),
      //actions
      actions: [
        //!!cancel
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.cancel.tr(context),
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.black),
          ),
        ),

        //!!confirm
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.ok.tr(context),
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}

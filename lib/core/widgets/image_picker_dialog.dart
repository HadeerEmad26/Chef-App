import 'package:chef_app/core/local/app_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_strings.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({
    super.key, required this.cameraOnTap, required this.galleryOnTap,
  });

  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //!! Camera
          ListTile(
            leading: Icon(
              Icons.camera_alt,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.camera.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!.copyWith(
                  color: AppColors.primary
              ),
            ),
            onTap: cameraOnTap,
          ),
          //!!gallery
          ListTile(
            leading: Icon(
              Icons.photo,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.gallery.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!.copyWith(
                  color: AppColors.primary
              ),
            ),
            onTap: galleryOnTap,
          ),
        ],
      ),
    );
  }
}

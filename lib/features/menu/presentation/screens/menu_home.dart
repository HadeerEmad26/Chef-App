import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../auth/presentation/auth_cubit/login_cubit.dart';
import '../components/menu_item_component.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              //add to menu button
              CustomButton(
                onPressed: () {},
                text: AppStrings.addDishToMenu.tr(context),
              ),
              //list of item
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MenuItemComponent(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

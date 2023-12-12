import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_color.dart';
import 'package:chef_app/core/utils/commens.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
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
                onPressed: () {
                  navigate(context: context, route: Routes.addMeal);
                },
                text: AppStrings.addDishToMenu.tr(context),
              ),
              //list of item
              BlocBuilder<MenuCubit, MenuState>(
                builder: (context, state) {
                  final menuCubit = BlocProvider.of<MenuCubit>(context);
                  return Expanded(
                    child: state is GetAllChefMealLoadingState
                        ? CustomLoadingIndicator()
                        : menuCubit.meals.isEmpty
                            ? Center(
                                child: Text(
                                  AppStrings.noMealsAdded.tr(context),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(color: AppColors.primary),
                                ),
                              )
                            : ListView.builder(
                                itemCount: menuCubit.meals.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: MenuItemComponent(
                                      mealModel: menuCubit.meals[index]),
                                ),
                              ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chef_app/core/local/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_google_nav_bar.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: BlocProvider.of<HomeCubit>(context)
              .screens[BlocProvider.of<HomeCubit>(context).currentIndex],
          bottomNavigationBar: CustomGNavWidget(
            onTabChanged: (index) {
              BlocProvider.of<HomeCubit>(context).changeIndex(index);
            },
            currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
            tabs: [
              GButton(
                icon: Icons.menu,
                text: AppStrings.menu.tr(context),
              ),
              GButton(
                icon: Icons.person,
                text: AppStrings.profile.tr(context),
              ),
            ],
          ),
        );
      },
    );
  }
}

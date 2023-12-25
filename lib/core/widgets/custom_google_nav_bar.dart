import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/app_color.dart';

class CustomGNavWidget extends StatelessWidget {
  const CustomGNavWidget({
    super.key,
    required this.currentIndex,
    this.onTabChanged,
    required this.tabs,
  });
  final int currentIndex;
  final Function(int)? onTabChanged;
  final List<GButton> tabs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.h,vertical: 16.h),
      child: GNav(
        activeColor: AppColors.primary,
        color: AppColors.primary,
        selectedIndex: currentIndex,
        onTabChange: onTabChanged,
        tabBackgroundColor: AppColors.black12,
        padding: const EdgeInsets.all(16),
        tabBorderRadius: 16,
        gap: 8,
        tabs: tabs,
      ),
    );
  }
}
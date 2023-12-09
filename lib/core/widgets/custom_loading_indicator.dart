import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_color.dart';

class CusotmLoadingIndicator extends StatelessWidget {
  const CusotmLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(color: AppColors.primary,);
  }
}

import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/utils/app_color.dart';
import 'package:chef_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commens.dart';

class SettingsScreen extends StatefulWidget {
   SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isArabicEnable= false;

  @override
  Widget build(BuildContext context) {
    AppProviders providers =Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigateReplacement(context: context, route: Routes.home);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          AppStrings.settings.tr(context),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Language (Ar  العربيه)",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium,
                  ),
                ),
                Spacer(),
                Switch(
                  value: providers.isArabicEnable,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                   providers.changeCurrentLanguage(value);
                  },
                )
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Dark Them",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium,
                  ),
                ),
                Spacer(),
                Switch(
                  value: providers.isDarkThemEnable,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    providers.changeThem(value);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

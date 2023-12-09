import 'package:chef_app/features/auth/presentation/screens/change_language.dart';
import 'package:chef_app/features/auth/presentation/screens/login.dart';
import 'package:chef_app/features/auth/presentation/screens/reset_password.dart';
import 'package:chef_app/features/auth/presentation/screens/send_code.dart';
import 'package:chef_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:chef_app/features/home/screens/home_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/add_meal_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/menu_home.dart';
import 'package:chef_app/features/profile/presentation/screens/change_password.dart';
import 'package:chef_app/features/profile/presentation/screens/profile_home.dart';
import 'package:chef_app/features/profile/presentation/screens/settings.dart';
import 'package:chef_app/features/profile/presentation/screens/update_profile.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String intitlRoutes = '/';
  static const String changeLang = '/changeLanguage';
  static const String login = '/login';
  static const String sendCode = '/sendCode';
  static const String resetPassword = '/resetPassword';
  static const String home = '/home';
  static const String menuHome = '/menuHome';
  static const String addMeal = '/addMeal';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String settings = '/settings';
  static const String changePassword = '/changePassword';
}

class AppRoutes {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case  Routes.intitlRoutes:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.changeLang:
        return MaterialPageRoute(builder: (_) => ChangeLanguageScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => SendCodeScreen());

      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());

      case Routes.menuHome:
        return MaterialPageRoute(builder: (_) => MenuHomeScreen());

      case Routes.addMeal:
        return MaterialPageRoute(builder: (_) => AddMealScreen());

      case Routes.profileHome:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case Routes.updateProfile:
        return MaterialPageRoute(builder: (_) => UpdateProfileScreen());

      case Routes.settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());

      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No Found Route")),
          ),
        );
    }
  }
}

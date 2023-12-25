import 'package:flutter/material.dart';

class AppProviders extends ChangeNotifier{
  bool isArabicEnable=false;
  bool isDarkThemEnable= false;

  changeCurrentLanguage(bool value){
    isArabicEnable=value;
    notifyListeners();
  }


  changeThem(bool value){
    isDarkThemEnable=value;
    notifyListeners();
  }


}

import 'package:chef_app/core/database/cache_helper/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/service_locator.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  //bool isArabicEnable = false;
  String langCode = 'ar';

  void changeLang(String codeLang) async{
    emit(ChangLangLoading());
   // isArabic=!isArabic;
    langCode = codeLang;
    await sl<CacheHelper>().cacheLanguage(codeLang);
    emit(ChangLangSuccess());
  }

  void getCachedLang(){
    emit(ChangLangLoading());
    final cachedLang=sl<CacheHelper>().getCachedLanguage();
    langCode=cachedLang;
    emit(ChangLangSuccess());
  }

}

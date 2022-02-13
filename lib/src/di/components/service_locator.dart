import 'package:get_it/get_it.dart';
import 'package:greenlife/src/data/repository.dart';
import 'package:greenlife/src/data/sharedpref/shared_preference_helper.dart';
import 'package:greenlife/src/di/module/local_module.dart';
import 'package:greenlife/src/stores/error/error_store.dart';
import 'package:greenlife/src/stores/form/form_store.dart';
import 'package:greenlife/src/stores/language/language_store.dart';
import 'package:greenlife/src/stores/theme/theme_store.dart';
import 'package:greenlife/src/stores/user/user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => FormStore());

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
    getIt<SharedPreferenceHelper>(),
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  getIt.registerSingleton(ThemeStore(getIt<Repository>()));
  getIt.registerSingleton(UserStore(getIt<Repository>()));
}

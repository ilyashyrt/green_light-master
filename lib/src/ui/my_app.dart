import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quiddy/src/constants/app_theme.dart';
import 'package:quiddy/src/constants/strings.dart';
import 'package:quiddy/src/data/repository.dart';
import 'package:quiddy/src/di/components/service_locator.dart';
import 'package:quiddy/src/stores/language/language_store.dart';
import 'package:quiddy/src/stores/theme/theme_store.dart';
import 'package:quiddy/src/stores/user/user_store.dart';
import 'package:quiddy/src/ui/account_info/account_info_screen.dart';
import 'package:quiddy/src/utils/locale/app_localization.dart';
import 'package:quiddy/src/utils/routes/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final UserStore _userStore = UserStore(getIt<Repository>());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: _themeStore.darkMode ? themeDataDark : themeData,
            routes: Routes.routes,
            locale: Locale(_languageStore.locale),
            supportedLocales: _languageStore.supportedLanguages
                .map((language) => Locale(language.locale!, language.code))
                .toList(),
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              AppLocalizations.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            home: AccountInfoSecreen(),
          );
        },
      ),
    );
  }
}

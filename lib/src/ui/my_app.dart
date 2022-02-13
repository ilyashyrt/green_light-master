import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:greenlife/src/constants/app_theme.dart';
import 'package:greenlife/src/constants/strings.dart';
import 'package:greenlife/src/data/repository.dart';
import 'package:greenlife/src/di/components/service_locator.dart';
import 'package:greenlife/src/providers/firebase_provider.dart';
import 'package:greenlife/src/stores/language/language_store.dart';
import 'package:greenlife/src/stores/theme/theme_store.dart';
import 'package:greenlife/src/stores/user/user_store.dart';
import 'package:greenlife/src/ui/dashboard/dashboard_main_screen.dart';
import 'package:greenlife/src/ui/dashboard/dashboard_screen.dart';
import 'package:greenlife/src/ui/login/login_screen.dart';
import 'package:greenlife/src/ui/onboarding/onboarding_screen.dart';
import 'package:greenlife/src/ui/register/register_screen.dart';
import 'package:greenlife/src/utils/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  final SharedPreferences prefs;

  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());

  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());

  final UserStore _userStore = UserStore(getIt<Repository>());

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  int whichPage = 0;

// burası sonradan düzenlenecek firebase'den auth işlemi gerekmekte
  checkOnBoard() {
    if (whichPage == 0) {
      return RegisterScreen();
    } else if (whichPage == 1) {
      return LoginScreen();
    } else if (whichPage == 2) {
      return DashboardMainScreen();
    } else {
      print('booşş');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<FirebaseProvider>(
          create: (_) =>
              FirebaseProvider(firebaseFirestore: this.firebaseFirestore),
        )
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'app name',
            theme: _themeStore.darkMode ? themeDataDark : themeData,
            routes: Routes.routes,
            locale: Locale(_languageStore.locale),
            supportedLocales: _languageStore.supportedLanguages
                .map((language) => Locale(language.locale!, language.code))
                .toList(),
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            home: checkOnBoard(),
          );
        },
      ),
    );
  }
}

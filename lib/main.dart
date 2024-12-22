import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruitsecommerce/core/Service/custom_bloc_observer.dart';
import 'package:fruitsecommerce/core/Service/shared_prefrences_singleton.dart';
import 'package:fruitsecommerce/core/helper_functions/on_generate_routes.dart';
import 'package:fruitsecommerce/core/utils/app_colors.dart';
import 'package:fruitsecommerce/features/splash/presentation/views/splash_view.dart';
import 'package:fruitsecommerce/firebase_options.dart';

import 'core/Service/get_it_service.dart';
import 'generated/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  ); await Prefs.init() ;
  setupGetit();
  runApp(const FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white  ,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        fontFamily: 'Cairo',
      )
      ,
      localizationsDelegates: const[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}

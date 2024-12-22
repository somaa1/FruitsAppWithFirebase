import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart'; // Ensure this import is present

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      // Lowercase 'k'
      log(' runtime ${bloc.runtimeType}   Bloc Change: ${change.toString()}');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      // Lowercase 'k'
      log('Bloc: ${bloc.runtimeType} - Transition: ${transition}');
    }
  }
}

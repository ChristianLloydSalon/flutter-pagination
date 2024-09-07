import 'package:flutter_bloc/flutter_bloc.dart';

enum AppThemeMode {
  dark,
  light;

  AppThemeMode get opposite {
    switch (this) {
      case AppThemeMode.dark:
        return AppThemeMode.light;
      case AppThemeMode.light:
        return AppThemeMode.dark;
    }
  }

  bool get isDark => this == AppThemeMode.dark;
  bool get isLight => this == AppThemeMode.light;
}

class ThemeBloc extends Cubit<AppThemeMode> {
  ThemeBloc() : super(AppThemeMode.dark);

  void toggle() {
    emit(state.opposite);
  }
}

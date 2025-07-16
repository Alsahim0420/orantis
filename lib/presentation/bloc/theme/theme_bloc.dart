import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Events
abstract class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTheme extends ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class SetTheme extends ThemeEvent {
  final bool isDarkMode;

  SetTheme(this.isDarkMode);

  @override
  List<Object?> get props => [isDarkMode];
}

// States
abstract class ThemeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ThemeLoading extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final bool isDarkMode;

  ThemeLoaded(this.isDarkMode);

  @override
  List<Object?> get props => [isDarkMode];
}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String _themeKey = 'isDarkMode';

  ThemeBloc() : super(ThemeLoading()) {
    on<LoadTheme>(_onLoadTheme);
    on<ToggleTheme>(_onToggleTheme);
    on<SetTheme>(_onSetTheme);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDarkMode = prefs.getBool(_themeKey) ?? false;
      emit(ThemeLoaded(isDarkMode));
    } catch (e) {
      emit(ThemeLoaded(false));
    }
  }

  Future<void> _onToggleTheme(
      ToggleTheme event, Emitter<ThemeState> emit) async {
    if (state is ThemeLoaded) {
      final currentState = state as ThemeLoaded;
      final newIsDarkMode = !currentState.isDarkMode;

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_themeKey, newIsDarkMode);
        emit(ThemeLoaded(newIsDarkMode));
      } catch (e) {
        emit(ThemeLoaded(newIsDarkMode));
      }
    }
  }

  Future<void> _onSetTheme(SetTheme event, Emitter<ThemeState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, event.isDarkMode);
      emit(ThemeLoaded(event.isDarkMode));
    } catch (e) {
      emit(ThemeLoaded(event.isDarkMode));
    }
  }
}

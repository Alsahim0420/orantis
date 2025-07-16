import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/entities/app_settings.dart';

// Events
abstract class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {}

class UpdateTheme extends SettingsEvent {
  final bool isDarkMode;

  UpdateTheme(this.isDarkMode);

  @override
  List<Object?> get props => [isDarkMode];
}

class UpdateAutoPlay extends SettingsEvent {
  final bool autoPlayAudio;

  UpdateAutoPlay(this.autoPlayAudio);

  @override
  List<Object?> get props => [autoPlayAudio];
}

class UpdateNotifications extends SettingsEvent {
  final bool showNotifications;

  UpdateNotifications(this.showNotifications);

  @override
  List<Object?> get props => [showNotifications];
}

class UpdateLanguage extends SettingsEvent {
  final String language;

  UpdateLanguage(this.language);

  @override
  List<Object?> get props => [language];
}

class UpdateAudioVolume extends SettingsEvent {
  final double audioVolume;

  UpdateAudioVolume(this.audioVolume);

  @override
  List<Object?> get props => [audioVolume];
}

class UpdateProgressBar extends SettingsEvent {
  final bool showProgressBar;

  UpdateProgressBar(this.showProgressBar);

  @override
  List<Object?> get props => [showProgressBar];
}

// States
abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final AppSettings settings;

  SettingsLoaded(this.settings);

  @override
  List<Object?> get props => [settings];
}

class SettingsError extends SettingsState {
  final String message;

  SettingsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsLoading()) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateTheme>(_onUpdateTheme);
    on<UpdateAutoPlay>(_onUpdateAutoPlay);
    on<UpdateNotifications>(_onUpdateNotifications);
    on<UpdateLanguage>(_onUpdateLanguage);
    on<UpdateAudioVolume>(_onUpdateAudioVolume);
    on<UpdateProgressBar>(_onUpdateProgressBar);
  }

  Future<void> _onLoadSettings(
      LoadSettings event, Emitter<SettingsState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDarkMode = prefs.getBool('isDarkMode') ?? false;
      final autoPlayAudio = prefs.getBool('autoPlayAudio') ?? true;
      final showNotifications = prefs.getBool('showNotifications') ?? true;
      final language = prefs.getString('language') ?? 'Español';
      final audioVolume = prefs.getDouble('audioVolume') ?? 1.0;
      final showProgressBar = prefs.getBool('showProgressBar') ?? true;

      final settings = AppSettings(
        isDarkMode: isDarkMode,
        autoPlayAudio: autoPlayAudio,
        showNotifications: showNotifications,
        language: language,
        audioVolume: audioVolume,
        showProgressBar: showProgressBar,
      );

      emit(SettingsLoaded(settings));
    } catch (e) {
      emit(SettingsLoaded(const AppSettings()));
    }
  }

  Future<void> _onUpdateTheme(
      UpdateTheme event, Emitter<SettingsState> emit) async {
    if (state is SettingsLoaded) {
      final currentSettings = (state as SettingsLoaded).settings;
      final newSettings =
          currentSettings.copyWith(isDarkMode: event.isDarkMode);
      emit(SettingsLoaded(newSettings));

      // Guardar en SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isDarkMode', event.isDarkMode);
      } catch (e) {
        // Si hay error al guardar, no hacer nada
      }
    }
  }

  Future<void> _onUpdateAutoPlay(
      UpdateAutoPlay event, Emitter<SettingsState> emit) async {
    if (state is SettingsLoaded) {
      final currentSettings = (state as SettingsLoaded).settings;
      final newSettings =
          currentSettings.copyWith(autoPlayAudio: event.autoPlayAudio);
      emit(SettingsLoaded(newSettings));

      // Guardar en SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('autoPlayAudio', event.autoPlayAudio);
      } catch (e) {
        // Si hay error al guardar, no hacer nada
      }
    }
  }

  Future<void> _onUpdateNotifications(
      UpdateNotifications event, Emitter<SettingsState> emit) async {
    if (state is SettingsLoaded) {
      final currentSettings = (state as SettingsLoaded).settings;
      final newSettings =
          currentSettings.copyWith(showNotifications: event.showNotifications);
      emit(SettingsLoaded(newSettings));

      // Guardar en SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('showNotifications', event.showNotifications);
      } catch (e) {
        // Si hay error al guardar, no hacer nada
      }
    }
  }

  Future<void> _onUpdateLanguage(
      UpdateLanguage event, Emitter<SettingsState> emit) async {
    if (state is SettingsLoaded) {
      final currentSettings = (state as SettingsLoaded).settings;
      final newSettings = currentSettings.copyWith(language: event.language);
      emit(SettingsLoaded(newSettings));

      // Guardar en SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('language', event.language);
      } catch (e) {
        // Si hay error al guardar, no hacer nada
      }
    }
  }

  Future<void> _onUpdateAudioVolume(
      UpdateAudioVolume event, Emitter<SettingsState> emit) async {
    if (state is SettingsLoaded) {
      final currentSettings = (state as SettingsLoaded).settings;
      final newSettings =
          currentSettings.copyWith(audioVolume: event.audioVolume);
      emit(SettingsLoaded(newSettings));

      // Guardar en SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setDouble('audioVolume', event.audioVolume);
      } catch (e) {
        // Si hay error al guardar, no hacer nada
      }
    }
  }

  Future<void> _onUpdateProgressBar(
      UpdateProgressBar event, Emitter<SettingsState> emit) async {
    if (state is SettingsLoaded) {
      final currentSettings = (state as SettingsLoaded).settings;
      final newSettings =
          currentSettings.copyWith(showProgressBar: event.showProgressBar);
      emit(SettingsLoaded(newSettings));

      // Guardar en SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('showProgressBar', event.showProgressBar);
      } catch (e) {
        // Si hay error al guardar, no hacer nada
      }
    }
  }
}

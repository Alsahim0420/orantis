import 'package:equatable/equatable.dart';

class AppSettings extends Equatable {
  final bool isDarkMode;
  final bool autoPlayAudio;
  final bool showNotifications;
  final String language;
  final double audioVolume;
  final bool showProgressBar;

  const AppSettings({
    this.isDarkMode = false,
    this.autoPlayAudio = false,
    this.showNotifications = true,
    this.language = 'Español',
    this.audioVolume = 1.0,
    this.showProgressBar = true,
  });

  AppSettings copyWith({
    bool? isDarkMode,
    bool? autoPlayAudio,
    bool? showNotifications,
    String? language,
    double? audioVolume,
    bool? showProgressBar,
  }) {
    return AppSettings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      autoPlayAudio: autoPlayAudio ?? this.autoPlayAudio,
      showNotifications: showNotifications ?? this.showNotifications,
      language: language ?? this.language,
      audioVolume: audioVolume ?? this.audioVolume,
      showProgressBar: showProgressBar ?? this.showProgressBar,
    );
  }

  @override
  List<Object?> get props => [
        isDarkMode,
        autoPlayAudio,
        showNotifications,
        language,
        audioVolume,
        showProgressBar,
      ];
}

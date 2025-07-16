import 'package:equatable/equatable.dart';

abstract class RosarioState extends Equatable {
  const RosarioState();
  @override
  List<Object?> get props => [];
}

class RosarioInitial extends RosarioState {}

class RosarioLoading extends RosarioState {}

class RosarioError extends RosarioState {
  final String message;
  const RosarioError(this.message);
  @override
  List<Object?> get props => [message];
}

class RosarioStepsLoaded extends RosarioState {
  final List<String> pasos;
  final int pasoActual;
  final int decenaActual;
  final String tipoMisterio;
  final bool isAudioPlaying;
  final bool autoAdvance;
  final Duration audioPosition;
  final Duration audioDuration;

  const RosarioStepsLoaded({
    required this.pasos,
    required this.pasoActual,
    required this.decenaActual,
    required this.tipoMisterio,
    this.isAudioPlaying = false,
    this.autoAdvance = false,
    this.audioPosition = Duration.zero,
    this.audioDuration = Duration.zero,
  });

  RosarioStepsLoaded copyWith({
    List<String>? pasos,
    int? pasoActual,
    int? decenaActual,
    String? tipoMisterio,
    bool? isAudioPlaying,
    bool? autoAdvance,
    Duration? audioPosition,
    Duration? audioDuration,
  }) {
    return RosarioStepsLoaded(
      pasos: pasos ?? this.pasos,
      pasoActual: pasoActual ?? this.pasoActual,
      decenaActual: decenaActual ?? this.decenaActual,
      tipoMisterio: tipoMisterio ?? this.tipoMisterio,
      isAudioPlaying: isAudioPlaying ?? this.isAudioPlaying,
      autoAdvance: autoAdvance ?? this.autoAdvance,
      audioPosition: audioPosition ?? this.audioPosition,
      audioDuration: audioDuration ?? this.audioDuration,
    );
  }

  @override
  List<Object?> get props => [
        pasos,
        pasoActual,
        decenaActual,
        tipoMisterio,
        isAudioPlaying,
        autoAdvance,
        audioPosition,
        audioDuration
      ];
}

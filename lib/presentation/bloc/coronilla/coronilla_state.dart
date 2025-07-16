import 'package:equatable/equatable.dart';
import '../../../domain/entities/coronilla_entity.dart';

abstract class CoronillaState extends Equatable {
  const CoronillaState();

  @override
  List<Object?> get props => [];
}

class CoronillaInitial extends CoronillaState {}

class CoronillaLoading extends CoronillaState {}

class CoronillaLoaded extends CoronillaState {
  final CoronillaEntity coronilla;

  const CoronillaLoaded(this.coronilla);

  @override
  List<Object?> get props => [coronilla];
}

class CoronillaStepsLoaded extends CoronillaState {
  final List<CoronillaStepEntity> steps;
  final int currentStepIndex;
  final bool isActive;
  final bool isAudioPlaying;
  final bool autoAdvance;
  final Duration audioPosition;
  final Duration audioDuration;

  const CoronillaStepsLoaded({
    required this.steps,
    required this.currentStepIndex,
    this.isActive = false,
    this.isAudioPlaying = false,
    this.autoAdvance = false,
    this.audioPosition = Duration.zero,
    this.audioDuration = Duration.zero,
  });

  CoronillaStepsLoaded copyWith({
    List<CoronillaStepEntity>? steps,
    int? currentStepIndex,
    bool? isActive,
    bool? isAudioPlaying,
    bool? autoAdvance,
    Duration? audioPosition,
    Duration? audioDuration,
  }) {
    return CoronillaStepsLoaded(
      steps: steps ?? this.steps,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      isActive: isActive ?? this.isActive,
      isAudioPlaying: isAudioPlaying ?? this.isAudioPlaying,
      autoAdvance: autoAdvance ?? this.autoAdvance,
      audioPosition: audioPosition ?? this.audioPosition,
      audioDuration: audioDuration ?? this.audioDuration,
    );
  }

  @override
  List<Object?> get props => [
        steps,
        currentStepIndex,
        isActive,
        isAudioPlaying,
        autoAdvance,
        audioPosition,
        audioDuration
      ];
}

class CoronillaError extends CoronillaState {
  final String message;

  const CoronillaError(this.message);

  @override
  List<Object?> get props => [message];
}

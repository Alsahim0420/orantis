import 'package:equatable/equatable.dart';

abstract class CoronillaEvent extends Equatable {
  const CoronillaEvent();

  @override
  List<Object?> get props => [];
}

class LoadCoronilla extends CoronillaEvent {}

class LoadCoronillaSteps extends CoronillaEvent {}

class StartCoronilla extends CoronillaEvent {}

class NextStep extends CoronillaEvent {}

class PreviousStep extends CoronillaEvent {}

class ResetCoronilla extends CoronillaEvent {}

class PlayAudio extends CoronillaEvent {
  final String audioPath;
  final dynamic step;

  const PlayAudio(this.audioPath, [this.step]);

  @override
  List<Object?> get props => [audioPath, step];
}

class PauseAudio extends CoronillaEvent {}

class ResumeAudio extends CoronillaEvent {}

class StopAudio extends CoronillaEvent {}

class ToggleAutoAdvance extends CoronillaEvent {}

class UpdateAudioProgress extends CoronillaEvent {
  final Duration position;
  final Duration duration;

  const UpdateAudioProgress(this.position, this.duration);

  @override
  List<Object?> get props => [position, duration];
}

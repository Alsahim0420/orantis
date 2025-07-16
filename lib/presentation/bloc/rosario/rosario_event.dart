import 'package:equatable/equatable.dart';

abstract class RosarioEvent extends Equatable {
  const RosarioEvent();

  @override
  List<Object?> get props => [];
}

class LoadRosarioSteps extends RosarioEvent {
  final String tipoMisterio;
  const LoadRosarioSteps(this.tipoMisterio);

  @override
  List<Object?> get props => [tipoMisterio];
}

class NextStep extends RosarioEvent {}

class PreviousStep extends RosarioEvent {}

class PlayAudio extends RosarioEvent {
  final String audioPath;
  final dynamic step;
  const PlayAudio(this.audioPath, [this.step]);
  @override
  List<Object?> get props => [audioPath, step];
}

class PauseAudio extends RosarioEvent {}

class ResumeAudio extends RosarioEvent {}

class StopAudio extends RosarioEvent {}

class ToggleAutoAdvance extends RosarioEvent {}

class UpdateAudioProgress extends RosarioEvent {
  final Duration position;
  final Duration duration;
  const UpdateAudioProgress(this.position, this.duration);
  @override
  List<Object?> get props => [position, duration];
}

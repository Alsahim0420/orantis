import 'package:equatable/equatable.dart';
import '../../../domain/entities/novena_entity.dart';

abstract class NovenaEvent extends Equatable {
  const NovenaEvent();

  @override
  List<Object?> get props => [];
}

class LoadNovena extends NovenaEvent {
  final Novena novena;

  const LoadNovena(this.novena);

  @override
  List<Object?> get props => [novena];
}

class NextDay extends NovenaEvent {}

class PreviousDay extends NovenaEvent {}

class ToggleAudio extends NovenaEvent {}

class ToggleAutoAdvance extends NovenaEvent {}

import 'package:equatable/equatable.dart';
import '../../../domain/entities/novena_entity.dart';

abstract class NovenaState extends Equatable {
  const NovenaState();

  @override
  List<Object?> get props => [];
}

class NovenaLoading extends NovenaState {}

class NovenaLoaded extends NovenaState {
  final Novena novena;
  final int currentDay;
  final bool isPlaying;
  final bool autoAdvance;

  const NovenaLoaded({
    required this.novena,
    required this.currentDay,
    this.isPlaying = false,
    this.autoAdvance = false,
  });

  @override
  List<Object?> get props => [novena, currentDay, isPlaying, autoAdvance];

  NovenaLoaded copyWith({
    Novena? novena,
    int? currentDay,
    bool? isPlaying,
    bool? autoAdvance,
  }) {
    return NovenaLoaded(
      novena: novena ?? this.novena,
      currentDay: currentDay ?? this.currentDay,
      isPlaying: isPlaying ?? this.isPlaying,
      autoAdvance: autoAdvance ?? this.autoAdvance,
    );
  }
}

class NovenaError extends NovenaState {
  final String message;

  const NovenaError(this.message);

  @override
  List<Object?> get props => [message];
}

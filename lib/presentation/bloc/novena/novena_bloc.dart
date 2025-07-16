import 'package:flutter_bloc/flutter_bloc.dart';
import 'novena_event.dart';
import 'novena_state.dart';

class NovenaBloc extends Bloc<NovenaEvent, NovenaState> {
  NovenaBloc() : super(NovenaLoading()) {
    on<LoadNovena>(_onLoadNovena);
    on<NextDay>(_onNextDay);
    on<PreviousDay>(_onPreviousDay);
    on<ToggleAudio>(_onToggleAudio);
    on<ToggleAutoAdvance>(_onToggleAutoAdvance);
  }

  void _onLoadNovena(LoadNovena event, Emitter<NovenaState> emit) {
    emit(NovenaLoaded(
      novena: event.novena,
      currentDay: 1,
    ));
  }

  void _onNextDay(NextDay event, Emitter<NovenaState> emit) {
    if (state is NovenaLoaded) {
      final currentState = state as NovenaLoaded;
      if (currentState.currentDay < currentState.novena.days.length) {
        emit(currentState.copyWith(
          currentDay: currentState.currentDay + 1,
          isPlaying: false, // Pausar audio al cambiar de día
        ));
      }
    }
  }

  void _onPreviousDay(PreviousDay event, Emitter<NovenaState> emit) {
    if (state is NovenaLoaded) {
      final currentState = state as NovenaLoaded;
      if (currentState.currentDay > 1) {
        emit(currentState.copyWith(
          currentDay: currentState.currentDay - 1,
          isPlaying: false, // Pausar audio al cambiar de día
        ));
      }
    }
  }

  void _onToggleAudio(ToggleAudio event, Emitter<NovenaState> emit) {
    if (state is NovenaLoaded) {
      final currentState = state as NovenaLoaded;
      emit(currentState.copyWith(
        isPlaying: !currentState.isPlaying,
      ));
    }
  }

  void _onToggleAutoAdvance(
      ToggleAutoAdvance event, Emitter<NovenaState> emit) {
    if (state is NovenaLoaded) {
      final currentState = state as NovenaLoaded;
      emit(currentState.copyWith(
        autoAdvance: !currentState.autoAdvance,
      ));
    }
  }
}

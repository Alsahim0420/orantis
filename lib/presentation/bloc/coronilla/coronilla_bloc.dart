import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/coronilla_repository_impl.dart';
import '../../../data/services/audio_service.dart';
import '../../../data/helpers/audio_mapper.dart';
import '../../../domain/usecases/get_coronilla_usecase.dart';
import '../../../domain/usecases/get_coronilla_steps_usecase.dart';
import 'coronilla_event.dart';
import 'coronilla_state.dart';

class CoronillaBloc extends Bloc<CoronillaEvent, CoronillaState> {
  final GetCoronillaUseCase _getCoronillaUseCase;
  final GetCoronillaStepsUseCase _getCoronillaStepsUseCase;
  final AudioService _audioService = AudioService();

  CoronillaBloc()
      : _getCoronillaUseCase = GetCoronillaUseCase(CoronillaRepositoryImpl()),
        _getCoronillaStepsUseCase =
            GetCoronillaStepsUseCase(CoronillaRepositoryImpl()),
        super(CoronillaInitial()) {
    on<LoadCoronilla>(_onLoadCoronilla);
    on<LoadCoronillaSteps>(_onLoadCoronillaSteps);
    on<StartCoronilla>(_onStartCoronilla);
    on<NextStep>(_onNextStep);
    on<PreviousStep>(_onPreviousStep);
    on<ResetCoronilla>(_onResetCoronilla);
    on<PlayAudio>(_onPlayAudio);
    on<PauseAudio>(_onPauseAudio);
    on<ResumeAudio>(_onResumeAudio);
    on<StopAudio>(_onStopAudio);
    on<ToggleAutoAdvance>(_onToggleAutoAdvance);
    on<UpdateAudioProgress>(_onUpdateAudioProgress);

    // Configurar callback para auto-avance
    _audioService.setOnAudioComplete(() {
      add(NextStep());
    });

    // Configurar callback para seguimiento de progreso
    _audioService.setOnProgressUpdate((position, duration) {
      add(UpdateAudioProgress(position, duration));
    });
  }

  Future<void> _onLoadCoronilla(
      LoadCoronilla event, Emitter<CoronillaState> emit) async {
    emit(CoronillaLoading());
    try {
      final coronilla = await _getCoronillaUseCase();
      emit(CoronillaLoaded(coronilla));
    } catch (e) {
      emit(CoronillaError('Error al cargar la coronilla: $e'));
    }
  }

  Future<void> _onLoadCoronillaSteps(
      LoadCoronillaSteps event, Emitter<CoronillaState> emit) async {
    emit(CoronillaLoading());
    try {
      final steps = await _getCoronillaStepsUseCase();
      emit(CoronillaStepsLoaded(
        steps: steps,
        currentStepIndex: 0,
        isActive: false,
      ));
    } catch (e) {
      emit(CoronillaError('Error al cargar los pasos de la coronilla: $e'));
    }
  }

  void _onStartCoronilla(StartCoronilla event, Emitter<CoronillaState> emit) {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      emit(currentState.copyWith(isActive: true));
    }
  }

  void _onNextStep(NextStep event, Emitter<CoronillaState> emit) {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      final nextIndex = currentState.currentStepIndex + 1;

      if (nextIndex < currentState.steps.length) {
        // Detener audio actual si está reproduciéndose
        if (currentState.isAudioPlaying) {
          _audioService.stopAudio();
        }

        final newState = currentState.copyWith(
          currentStepIndex: nextIndex,
          audioPosition: Duration.zero,
          audioDuration: Duration.zero,
          isAudioPlaying: false,
        );
        emit(newState);

        // Reproducir automáticamente el audio del siguiente paso si auto-avance está activado
        if (currentState.autoAdvance) {
          final nextStep = newState.steps[nextIndex];
          final audioPath = AudioMapper.getAudioPathForStep(nextStep);
          _audioService.playAudio(audioPath, nextStep);
          emit(newState.copyWith(isAudioPlaying: true));
        }
      }
    }
  }

  void _onPreviousStep(PreviousStep event, Emitter<CoronillaState> emit) {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      final previousIndex = currentState.currentStepIndex - 1;

      if (previousIndex >= 0) {
        // Detener audio actual si está reproduciéndose
        if (currentState.isAudioPlaying) {
          _audioService.stopAudio();
        }

        emit(currentState.copyWith(
          currentStepIndex: previousIndex,
          audioPosition: Duration.zero,
          audioDuration: Duration.zero,
          isAudioPlaying: false,
        ));
      }
    }
  }

  void _onResetCoronilla(ResetCoronilla event, Emitter<CoronillaState> emit) {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      emit(currentState.copyWith(
        currentStepIndex: 0,
        isActive: false,
      ));
    }
  }

  Future<void> _onPlayAudio(
      PlayAudio event, Emitter<CoronillaState> emit) async {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      final currentStep = currentState.steps[currentState.currentStepIndex];
      final audioPath = AudioMapper.getAudioPathForStep(currentStep);
      final textToSpeak = AudioMapper.getTextForStep(currentStep);

      debugPrint('CoronillaBloc: Reproduciendo audio: $audioPath');
      debugPrint('CoronillaBloc: Texto a reproducir: $textToSpeak');

      await _audioService.playAudio(audioPath, currentStep);
      emit(currentState.copyWith(isAudioPlaying: true));
    }
  }

  Future<void> _onPauseAudio(
      PauseAudio event, Emitter<CoronillaState> emit) async {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      await _audioService.pauseAudio();
      emit(currentState.copyWith(isAudioPlaying: false));
    }
  }

  Future<void> _onResumeAudio(
      ResumeAudio event, Emitter<CoronillaState> emit) async {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      await _audioService.resumeAudio();
      emit(currentState.copyWith(isAudioPlaying: true));
    }
  }

  Future<void> _onStopAudio(
      StopAudio event, Emitter<CoronillaState> emit) async {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      await _audioService.stopAudio();
      emit(currentState.copyWith(isAudioPlaying: false));
    }
  }

  void _onToggleAutoAdvance(
      ToggleAutoAdvance event, Emitter<CoronillaState> emit) {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      final newAutoAdvance = !currentState.autoAdvance;
      _audioService.setAutoAdvance(newAutoAdvance);
      emit(currentState.copyWith(autoAdvance: newAutoAdvance));
    }
  }

  void _onUpdateAudioProgress(
      UpdateAudioProgress event, Emitter<CoronillaState> emit) {
    if (state is CoronillaStepsLoaded) {
      final currentState = state as CoronillaStepsLoaded;
      emit(currentState.copyWith(
        audioPosition: event.position,
        audioDuration: event.duration,
      ));
    }
  }

  @override
  Future<void> close() {
    _audioService.dispose();
    return super.close();
  }
}

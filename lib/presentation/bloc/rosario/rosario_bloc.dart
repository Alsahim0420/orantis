import 'package:flutter_bloc/flutter_bloc.dart';
import 'rosario_event.dart';
import 'rosario_state.dart';
import '../../../data/services/audio_service.dart';
import '../../../data/helpers/audio_mapper.dart';
import '../../../domain/entities/rosario_entity.dart';

class RosarioBloc extends Bloc<RosarioEvent, RosarioState> {
  final AudioService _audioService = AudioService();

  RosarioBloc() : super(RosarioInitial()) {
    on<LoadRosarioSteps>(_onLoadRosarioSteps);
    on<NextStep>(_onNextStep);
    on<PreviousStep>(_onPreviousStep);
    on<PlayAudio>(_onPlayAudio);
    on<PauseAudio>(_onPauseAudio);
    on<ResumeAudio>(_onResumeAudio);
    on<StopAudio>(_onStopAudio);
    on<ToggleAutoAdvance>(_onToggleAutoAdvance);
    on<UpdateAudioProgress>(_onUpdateAudioProgress);

    _audioService.setOnAudioComplete(() {
      add(NextStep());
    });
    _audioService.setOnProgressUpdate((position, duration) {
      add(UpdateAudioProgress(position, duration));
    });
  }

  void _onLoadRosarioSteps(LoadRosarioSteps event, Emitter<RosarioState> emit) {
    emit(RosarioLoading());
    try {
      final tipoMisterio = event.tipoMisterio;
      final misterios =
          RosarioData.getMisterios(_parseTipoMisterio(tipoMisterio));
      final pasos = _generarPasos(misterios);
      emit(RosarioStepsLoaded(
        pasos: pasos,
        pasoActual: 0,
        decenaActual: 0,
        tipoMisterio: tipoMisterio,
      ));
    } catch (e) {
      emit(RosarioError('Error al cargar los pasos del Rosario: $e'));
    }
  }

  void _onNextStep(NextStep event, Emitter<RosarioState> emit) {
    if (state is RosarioStepsLoaded) {
      final currentState = state as RosarioStepsLoaded;
      final nextIndex = currentState.pasoActual + 1;
      if (nextIndex < currentState.pasos.length) {
        // Detener audio actual si está reproduciéndose
        if (currentState.isAudioPlaying) {
          _audioService.stopAudio();
        }

        final newState = currentState.copyWith(
          pasoActual: nextIndex,
          decenaActual: _calcularDecena(nextIndex),
          audioPosition: Duration.zero,
          audioDuration: Duration.zero,
          isAudioPlaying: false,
        );
        emit(newState);
        if (currentState.autoAdvance) {
          final stepObject = _buildStepObject(newState, nextIndex);
          final audioPath = AudioMapper.getAudioPathForStep(stepObject);
          _audioService.playAudio(audioPath, stepObject);
          emit(newState.copyWith(isAudioPlaying: true));
        }
      }
    }
  }

  void _onPreviousStep(PreviousStep event, Emitter<RosarioState> emit) {
    if (state is RosarioStepsLoaded) {
      final currentState = state as RosarioStepsLoaded;
      final previousIndex = currentState.pasoActual - 1;
      if (previousIndex >= 0) {
        // Detener audio actual si está reproduciéndose
        if (currentState.isAudioPlaying) {
          _audioService.stopAudio();
        }

        emit(currentState.copyWith(
          pasoActual: previousIndex,
          decenaActual: _calcularDecena(previousIndex),
          audioPosition: Duration.zero,
          audioDuration: Duration.zero,
          isAudioPlaying: false,
        ));
      }
    }
  }

  Future<void> _onPlayAudio(PlayAudio event, Emitter<RosarioState> emit) async {
    if (state is RosarioStepsLoaded) {
      final currentState = state as RosarioStepsLoaded;
      await _audioService.playAudio(event.audioPath, event.step);
      emit(currentState.copyWith(isAudioPlaying: true));
    }
  }

  Future<void> _onPauseAudio(
      PauseAudio event, Emitter<RosarioState> emit) async {
    if (state is RosarioStepsLoaded) {
      final currentState = state as RosarioStepsLoaded;
      await _audioService.pauseAudio();
      emit(currentState.copyWith(isAudioPlaying: false));
    }
  }

  Future<void> _onResumeAudio(
      ResumeAudio event, Emitter<RosarioState> emit) async {
    if (state is RosarioStepsLoaded) {
      final currentState = state as RosarioStepsLoaded;
      await _audioService.resumeAudio();
      emit(currentState.copyWith(isAudioPlaying: true));
    }
  }

  Future<void> _onStopAudio(StopAudio event, Emitter<RosarioState> emit) async {
    if (state is RosarioStepsLoaded) {
      final currentState = state as RosarioStepsLoaded;
      await _audioService.stopAudio();
      emit(currentState.copyWith(isAudioPlaying: false));
    }
  }

  void _onToggleAutoAdvance(
      ToggleAutoAdvance event, Emitter<RosarioState> emit) {
    if (state is RosarioStepsLoaded) {
      final currentState = state as RosarioStepsLoaded;
      final newAutoAdvance = !currentState.autoAdvance;
      _audioService.setAutoAdvance(newAutoAdvance);
      emit(currentState.copyWith(autoAdvance: newAutoAdvance));
    }
  }

  void _onUpdateAudioProgress(
      UpdateAudioProgress event, Emitter<RosarioState> emit) {
    if (state is RosarioStepsLoaded) {
      final currentState = state as RosarioStepsLoaded;
      emit(currentState.copyWith(
        audioPosition: event.position,
        audioDuration: event.duration,
      ));
    }
  }

  List<String> _generarPasos(List<Misterio> misterios) {
    final pasos = <String>[];
    pasos.add('Oración Inicial');
    for (int i = 0; i < 5; i++) {
      pasos.add('Decena ${i + 1} - ${misterios[i].titulo}');
      pasos.add('Padre Nuestro');
      for (int j = 0; j < 10; j++) {
        pasos.add('Ave María ${j + 1}');
      }
      pasos.add('Gloria');
      pasos.add('Oración de Fátima');
    }
    pasos.add('Oración Final');
    return pasos;
  }

  int _calcularDecena(int pasoActual) {
    return (pasoActual - 1) ~/ 14;
  }

  dynamic _buildStepObject(RosarioStepsLoaded state, int pasoIndex) {
    final paso = state.pasos[pasoIndex];
    return {
      'title': paso,
      'content': _obtenerOracionActual(state, pasoIndex),
      'decadeNumber':
          paso.startsWith('Decena') ? int.parse(paso.split(' ')[1]) : null,
      'repetitionNumber':
          paso.startsWith('Ave María') ? int.parse(paso.split(' ')[2]) : null,
    };
  }

  String _obtenerOracionActual(RosarioStepsLoaded state, int pasoIndex) {
    final paso = state.pasos[pasoIndex];
    if (paso == 'Oración Inicial') {
      return RosarioData.oracionInicial;
    } else if (paso == 'Oración Final') {
      return RosarioData.oracionFinal;
    } else if (paso == 'Padre Nuestro') {
      return RosarioData.padrenuestro;
    } else if (paso.startsWith('Ave María')) {
      return RosarioData.avemaria;
    } else if (paso == 'Gloria') {
      return RosarioData.gloria;
    } else if (paso == 'Oración de Fátima') {
      return RosarioData.fatima;
    } else if (paso.startsWith('Decena')) {
      final misterios =
          RosarioData.getMisterios(_parseTipoMisterio(state.tipoMisterio));
      final decenaIndex = int.parse(paso.split(' ')[1]) - 1;
      return misterios[decenaIndex].oracion;
    }
    return '';
  }

  TipoMisterio _parseTipoMisterio(String tipo) {
    switch (tipo) {
      case 'gozosos':
        return TipoMisterio.gozosos;
      case 'dolorosos':
        return TipoMisterio.dolorosos;
      case 'gloriosos':
        return TipoMisterio.gloriosos;
      case 'luminosos':
        return TipoMisterio.luminosos;
      default:
        return TipoMisterio.gozosos;
    }
  }

  @override
  Future<void> close() {
    _audioService.dispose();
    return super.close();
  }
}

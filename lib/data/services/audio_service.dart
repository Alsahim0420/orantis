import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'tts_service.dart';
import '../helpers/audio_mapper.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  AudioPlayer? _audioPlayer;
  final TTSService _ttsService = TTSService();
  bool _isPlaying = false;
  bool _autoAdvance = true;
  Function()? _onAudioComplete;
  bool _isInitialized = false;
  dynamic _currentStep;

  // Para seguimiento de progreso
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  Function(Duration position, Duration duration)? _onProgressUpdate;
  Timer? _ttsTimer;

  bool get isPlaying => _isPlaying;
  bool get autoAdvance => _autoAdvance;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;

  void setAutoAdvance(bool value) {
    _autoAdvance = value;
  }

  void setOnAudioComplete(Function() callback) {
    _onAudioComplete = callback;
  }

  void setOnProgressUpdate(
      Function(Duration position, Duration duration) callback) {
    _onProgressUpdate = callback;
  }

  Future<void> _initializePlayer() async {
    if (!_isInitialized) {
      _audioPlayer = AudioPlayer();
      _isInitialized = true;
    }
  }

  // Calcular duración estimada del TTS basada en la longitud del texto
  Duration _calculateTTSDuration(String text) {
    // Estimación: aproximadamente 150 palabras por minuto en español
    // Una palabra promedio tiene 5 caracteres
    final wordCount = text.length / 5;
    final minutes = wordCount / 150;
    final seconds = (minutes * 60).round();

    // Mínimo 5 segundos, máximo 60 segundos
    final duration = Duration(seconds: seconds.clamp(5, 60));
    debugPrint(
        'AudioService: Texto de ${text.length} caracteres, duración estimada: ${duration.inSeconds} segundos');
    return duration;
  }

  Future<void> playAudio(String audioPath, [dynamic step]) async {
    try {
      // Detener cualquier audio que esté reproduciéndose actualmente
      await _stopCurrentAudio();

      _currentStep = step;

      // Si la ruta está vacía, usar TTS
      if (audioPath.isEmpty) {
        debugPrint('AudioService: Usando TTS para reproducir audio');
        _isPlaying = true;
        _currentPosition = Duration.zero;

        // Obtener el texto correcto del paso
        String textToSpeak;
        if (step != null) {
          textToSpeak = AudioMapper.getTextForStep(step);
          debugPrint(
              'AudioService: Texto obtenido del AudioMapper: "${textToSpeak.substring(0, textToSpeak.length > 50 ? 50 : textToSpeak.length)}..."');
        } else {
          textToSpeak =
              "En el nombre del Padre, y del Hijo, y del Espíritu Santo. Amén.";
          debugPrint('AudioService: Usando texto por defecto');
        }

        // Calcular duración basada en la longitud del texto
        _totalDuration = _calculateTTSDuration(textToSpeak);

        // Configurar callback para cuando termine el TTS
        _ttsService.setOnSpeechComplete(() {
          debugPrint('AudioService: TTS completado, avanzando automáticamente');
          _isPlaying = false;
          _ttsTimer?.cancel();
          _ttsTimer = null;
          if (_autoAdvance && _onAudioComplete != null) {
            _onAudioComplete!();
          }
        });

        // Simular progreso para TTS
        _startTTSTimer();

        // Usar TTS para reproducir el texto
        await _ttsService.speak(textToSpeak);
      } else {
        // Usar archivo de audio si existe
        await _initializePlayer();

        if (_audioPlayer != null) {
          debugPrint('Intentando reproducir audio: $audioPath');
          await _audioPlayer!.play(AssetSource(audioPath));
          _isPlaying = true;
          _currentPosition = Duration.zero;

          // Configurar listener para cuando termine el audio
          _audioPlayer!.onPlayerComplete.listen((event) {
            _isPlaying = false;
            if (_autoAdvance && _onAudioComplete != null) {
              _onAudioComplete!();
            }
          });

          // Configurar listener para seguimiento de progreso
          _audioPlayer!.onPositionChanged.listen((position) {
            _currentPosition = position;
            debugPrint(
                'AudioService: Posición actualizada: ${position.inSeconds}s / ${_totalDuration.inSeconds}s');
            if (_onProgressUpdate != null) {
              _onProgressUpdate!(position, _totalDuration);
            }
          });

          // Configurar listener para obtener la duración total
          _audioPlayer!.onDurationChanged.listen((duration) {
            _totalDuration = duration;
            debugPrint(
                'AudioService: Duración cargada: ${duration.inSeconds} segundos');
            if (_onProgressUpdate != null) {
              _onProgressUpdate!(_currentPosition, _totalDuration);
            }
          });
        }
      }
    } catch (e) {
      debugPrint('Error reproduciendo audio: $e');
      _isPlaying = false;
    }
  }

  // Método para detener el audio actual (archivo o TTS)
  Future<void> _stopCurrentAudio() async {
    try {
      debugPrint('AudioService: Deteniendo audio actual');

      // Detener TTS si está reproduciéndose
      await _ttsService.stop();
      _ttsTimer?.cancel();
      _ttsTimer = null;

      // Detener archivo de audio si está reproduciéndose
      if (_audioPlayer != null) {
        await _audioPlayer!.stop();
      }

      _isPlaying = false;
      _currentPosition = Duration.zero;
      debugPrint('AudioService: Audio actual detenido');
    } catch (e) {
      debugPrint('Error deteniendo audio actual: $e');
    }
  }

  Future<void> pauseAudio() async {
    try {
      if (_audioPlayer != null) {
        await _audioPlayer!.pause();
        _isPlaying = false;
      } else {
        // Pausar TTS
        await _ttsService.pause();
        _ttsTimer?.cancel();
        _ttsTimer = null;
        _isPlaying = false;
        debugPrint('AudioService: TTS pausado');
      }
    } catch (e) {
      debugPrint('Error pausando audio: $e');
    }
  }

  Future<void> resumeAudio() async {
    try {
      if (_audioPlayer != null) {
        await _audioPlayer!.resume();
        _isPlaying = true;
      } else {
        // Reanudar TTS - reiniciar desde el principio
        _isPlaying = true;
        _currentPosition = Duration.zero;

        // Obtener el texto correcto del paso
        String textToSpeak;
        if (_currentStep != null) {
          textToSpeak = AudioMapper.getTextForStep(_currentStep);
          debugPrint('AudioService: Reanudando TTS con texto del AudioMapper');
        } else {
          textToSpeak =
              "En el nombre del Padre, y del Hijo, y del Espíritu Santo. Amén.";
          debugPrint('AudioService: Reanudando TTS con texto por defecto');
        }

        // Recalcular duración
        _totalDuration = _calculateTTSDuration(textToSpeak);

        // Configurar callback para cuando termine el TTS
        _ttsService.setOnSpeechComplete(() {
          debugPrint('AudioService: TTS completado, avanzando automáticamente');
          _isPlaying = false;
          _ttsTimer?.cancel();
          _ttsTimer = null;
          if (_autoAdvance && _onAudioComplete != null) {
            _onAudioComplete!();
          }
        });

        _startTTSTimer();

        await _ttsService.speak(textToSpeak);
        debugPrint('AudioService: TTS reanudado');
      }
    } catch (e) {
      debugPrint('Error resumiendo audio: $e');
    }
  }

  Future<void> stopAudio() async {
    try {
      await _stopCurrentAudio();
    } catch (e) {
      debugPrint('Error deteniendo audio: $e');
    }
  }

  void _startTTSTimer() {
    // Cancelar timer anterior si existe
    _ttsTimer?.cancel();

    // Simular progreso para TTS
    _ttsTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_isPlaying && _currentPosition < _totalDuration) {
        _currentPosition += const Duration(milliseconds: 500);
        if (_onProgressUpdate != null) {
          _onProgressUpdate!(_currentPosition, _totalDuration);
        }
      } else {
        timer.cancel();
        _ttsTimer = null;

        // Si terminó naturalmente (no por pausa), avanzar automáticamente
        if (_isPlaying && _autoAdvance && _onAudioComplete != null) {
          _isPlaying = false;
          _onAudioComplete!();
        }
      }
    });
  }

  Future<void> dispose() async {
    await _stopCurrentAudio();
    if (_audioPlayer != null) {
      await _audioPlayer!.dispose();
      _audioPlayer = null;
      _isInitialized = false;
    }
    _ttsTimer?.cancel();
    _ttsTimer = null;
    await _ttsService.dispose();
  }
}

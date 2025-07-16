import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/foundation.dart';

class TTSService {
  static final TTSService _instance = TTSService._internal();
  factory TTSService() => _instance;
  TTSService._internal();

  FlutterTts? _flutterTts;
  bool _isInitialized = false;
  Function()? _onSpeechComplete;

  Future<void> _initializeTTS() async {
    if (!_isInitialized) {
      _flutterTts = FlutterTts();

      // Configurar TTS para español
      await _flutterTts!.setLanguage("es-ES");
      await _flutterTts!
          .setSpeechRate(0.5); // Velocidad más lenta para oraciones
      await _flutterTts!.setVolume(1.0);
      await _flutterTts!.setPitch(1.0);

      // Configurar callbacks
      _flutterTts!.setCompletionHandler(() {
        debugPrint('TTS: Habla completada');
        if (_onSpeechComplete != null) {
          _onSpeechComplete!();
        }
      });

      _flutterTts!.setErrorHandler((msg) {
        debugPrint('TTS Error: $msg');
      });

      _isInitialized = true;
      debugPrint('TTS inicializado correctamente');
    }
  }

  void setOnSpeechComplete(Function() callback) {
    _onSpeechComplete = callback;
  }

  Future<void> speak(String text) async {
    try {
      await _initializeTTS();

      if (_flutterTts != null) {
        debugPrint(
            'TTS: Reproduciendo texto: ${text.substring(0, text.length > 50 ? 50 : text.length)}...');
        await _flutterTts!.speak(text);
      }
    } catch (e) {
      debugPrint('Error en TTS: $e');
    }
  }

  Future<void> pause() async {
    try {
      if (_flutterTts != null) {
        await _flutterTts!.pause();
        debugPrint('TTS: Pausado');
      }
    } catch (e) {
      debugPrint('Error pausando TTS: $e');
    }
  }

  Future<void> stop() async {
    try {
      if (_flutterTts != null) {
        await _flutterTts!.stop();
        debugPrint('TTS: Detenido');
      }
    } catch (e) {
      debugPrint('Error deteniendo TTS: $e');
    }
  }

  Future<void> dispose() async {
    try {
      if (_flutterTts != null) {
        await _flutterTts!.stop();
      }
    } catch (e) {
      debugPrint('Error en dispose TTS: $e');
    }
  }
}

import 'package:flutter/foundation.dart';

class AudioMapper {
  static String getAudioPathForStep(dynamic step) {
    // Por ahora, retornamos una ruta vacía ya que usaremos TTS
    final title = _getStepTitle(step);
    debugPrint('AudioMapper: Usando TTS para "$title"');
    return '';
  }

  static String getTextForStep(dynamic step) {
    final title = _getStepTitle(step).toLowerCase();
    final content = _getStepContent(step);

    debugPrint(
        'AudioMapper: getTextForStep - title: "$title", content length: ${content.length}');

    if (title.contains('señal de la cruz')) {
      debugPrint('AudioMapper: Retornando texto para Señal de la Cruz');
      return content;
    } else if (title.contains('credo')) {
      debugPrint('AudioMapper: Retornando texto para Credo');
      return content;
    } else if (title.contains('padre nuestro')) {
      debugPrint('AudioMapper: Retornando texto para Padre Nuestro');
      return content;
    } else if (title.contains('ave maría')) {
      debugPrint('AudioMapper: Retornando texto para Ave María');
      return content;
    } else if (title.contains('gloria')) {
      debugPrint('AudioMapper: Retornando texto para Gloria');
      return content;
    } else if (title.contains('oración final')) {
      debugPrint('AudioMapper: Retornando texto para Oración Final');
      return content;
    } else if (title.contains('decena')) {
      debugPrint('AudioMapper: Retornando texto para Decena');
      return content;
    } else if (title.contains('oración inicial')) {
      debugPrint('AudioMapper: Retornando texto para Oración Inicial');
      return content;
    } else if (title.contains('oración de fátima')) {
      debugPrint('AudioMapper: Retornando texto para Oración de Fátima');
      return content;
    } else {
      debugPrint('AudioMapper: Retornando contenido por defecto');
      return content;
    }
  }

  static bool hasAudioForStep(dynamic step) {
    // Por ahora retornamos true, pero en una implementación real
    // podrías verificar si el archivo existe
    return true;
  }

  // Helper para obtener el título del paso de forma segura
  static String _getStepTitle(dynamic step) {
    if (step is Map) {
      final title = step['title']?.toString() ?? '';
      debugPrint('AudioMapper: _getStepTitle (Map) - "$title"');
      return title;
    } else {
      // Intentar acceder como propiedad
      try {
        final title = step.title?.toString() ?? '';
        debugPrint('AudioMapper: _getStepTitle (Object) - "$title"');
        return title;
      } catch (e) {
        debugPrint('AudioMapper: _getStepTitle error - $e');
        return '';
      }
    }
  }

  // Helper para obtener el contenido del paso de forma segura
  static String _getStepContent(dynamic step) {
    if (step is Map) {
      final content = step['content']?.toString() ?? '';
      debugPrint(
          'AudioMapper: _getStepContent (Map) - length: ${content.length}');
      return content;
    } else {
      // Intentar acceder como propiedad
      try {
        final content = step.content?.toString() ?? '';
        debugPrint(
            'AudioMapper: _getStepContent (Object) - length: ${content.length}');
        return content;
      } catch (e) {
        debugPrint('AudioMapper: _getStepContent error - $e');
        return '';
      }
    }
  }
}

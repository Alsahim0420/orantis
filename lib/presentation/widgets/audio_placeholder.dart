import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';

class AudioPlaceholder extends StatelessWidget {
  const AudioPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              Icons.audio_file,
              size: 48,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'Audio no disponible',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Para usar la funcionalidad de audio, agrega archivos de audio en la carpeta assets/audio/',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Aquí podrías abrir un diálogo con instrucciones
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Instrucciones para Audio'),
                    content: const Text(
                      'Para agregar audio a las oraciones:\n\n'
                      '1. Coloca archivos MP3 en assets/audio/\n'
                      '2. Nombra los archivos según el patrón:\n'
                      '   - senal_cruz.mp3\n'
                      '   - padre_nuestro.mp3\n'
                      '   - ave_maria.mp3\n'
                      '   - credo.mp3\n'
                      '   - gloria.mp3\n'
                      '   - decena_1.mp3, decena_2.mp3, etc.\n'
                      '   - oracion_final.mp3\n\n'
                      '3. Ejecuta flutter pub get\n'
                      '4. Reinicia la aplicación',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Entendido'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.help_outline),
              label: const Text('Ver instrucciones'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

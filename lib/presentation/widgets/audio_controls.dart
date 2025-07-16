import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/coronilla/coronilla_bloc.dart';
import '../bloc/coronilla/coronilla_event.dart' as coronilla;
import '../bloc/coronilla/coronilla_state.dart';
import '../bloc/rosario/rosario_bloc.dart';
import '../bloc/rosario/rosario_event.dart' as rosario;
import '../bloc/rosario/rosario_state.dart';
import 'audio_placeholder.dart';
import '../../../data/helpers/audio_mapper.dart';
import '../../app/theme/app_theme.dart';

class AudioControls<T extends Bloc> extends StatelessWidget {
  final dynamic currentStep;

  const AudioControls({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    if (T == CoronillaBloc) {
      return BlocBuilder<CoronillaBloc, CoronillaState>(
        builder: (context, state) {
          if (state is! CoronillaStepsLoaded) {
            return const SizedBox.shrink();
          }

          // Verificar si hay audio disponible para este paso
          if (AudioMapper.hasAudioForStep(currentStep)) {
            return _buildAudioControls(context, state);
          } else {
            return const AudioPlaceholder();
          }
        },
      );
    } else if (T == RosarioBloc) {
      return BlocBuilder<RosarioBloc, RosarioState>(
        builder: (context, state) {
          if (state is! RosarioStepsLoaded) {
            return const SizedBox.shrink();
          }

          // Verificar si hay audio disponible para este paso
          if (AudioMapper.hasAudioForStep(currentStep)) {
            return _buildAudioControls(context, state);
          } else {
            return const AudioPlaceholder();
          }
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildAudioControls(BuildContext context, dynamic state) {
    bool isAudioPlaying;
    Duration audioPosition;
    Duration audioDuration;
    bool autoAdvance;
    Function() onToggleAutoAdvance;
    Function() onPreviousStep;
    Function() onNextStep;
    Function() onPauseAudio;
    Function(String) onPlayAudio;

    if (state is CoronillaStepsLoaded) {
      isAudioPlaying = state.isAudioPlaying;
      audioPosition = state.audioPosition;
      audioDuration = state.audioDuration;
      autoAdvance = state.autoAdvance;
      onToggleAutoAdvance = () =>
          context.read<CoronillaBloc>().add(coronilla.ToggleAutoAdvance());
      onPreviousStep =
          () => context.read<CoronillaBloc>().add(coronilla.PreviousStep());
      onNextStep =
          () => context.read<CoronillaBloc>().add(coronilla.NextStep());
      onPauseAudio =
          () => context.read<CoronillaBloc>().add(coronilla.PauseAudio());
      onPlayAudio = (audioPath) => context
          .read<CoronillaBloc>()
          .add(coronilla.PlayAudio(audioPath, currentStep));
    } else if (state is RosarioStepsLoaded) {
      isAudioPlaying = state.isAudioPlaying;
      audioPosition = state.audioPosition;
      audioDuration = state.audioDuration;
      autoAdvance = state.autoAdvance;
      onToggleAutoAdvance =
          () => context.read<RosarioBloc>().add(rosario.ToggleAutoAdvance());
      onPreviousStep =
          () => context.read<RosarioBloc>().add(rosario.PreviousStep());
      onNextStep = () => context.read<RosarioBloc>().add(rosario.NextStep());
      onPauseAudio =
          () => context.read<RosarioBloc>().add(rosario.PauseAudio());
      onPlayAudio = (audioPath) => context
          .read<RosarioBloc>()
          .add(rosario.PlayAudio(audioPath, currentStep));
    } else {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Header con icono y switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.volume_up,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Audio',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: autoAdvance
                          ? AppTheme.primaryBlue.withOpacity(0.1)
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: autoAdvance
                            ? AppTheme.primaryBlue
                            : Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          size: 14,
                          color: autoAdvance
                              ? AppTheme.primaryBlue
                              : Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Auto',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: autoAdvance
                                ? AppTheme.primaryBlue
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Switch(
                    value: autoAdvance,
                    onChanged: (value) => onToggleAutoAdvance(),
                    activeColor: AppTheme.primaryBlue,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Barra de progreso del audio mejorada
          if (isAudioPlaying || audioDuration > Duration.zero) ...[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _formatDuration(audioPosition),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryBlue,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        audioDuration > Duration.zero
                            ? _formatDuration(audioDuration)
                            : '--:--',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Stack(
                  children: [
                    Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 6,
                      width: MediaQuery.of(context).size.width *
                          0.7 *
                          (audioDuration > Duration.zero
                              ? audioPosition.inMilliseconds /
                                  audioDuration.inMilliseconds
                              : 0.0),
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryBlue.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],

          // Controles de reproducción mejorados
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildControlButton(
                context,
                icon: Icons.skip_previous,
                onPressed: onPreviousStep,
                isPrimary: false,
              ),
              _buildControlButton(
                context,
                icon: isAudioPlaying ? Icons.pause : Icons.play_arrow,
                onPressed: isAudioPlaying
                    ? onPauseAudio
                    : () {
                        final audioPath =
                            AudioMapper.getAudioPathForStep(currentStep);
                        debugPrint('AudioControls: Ruta generada: $audioPath');
                        onPlayAudio(audioPath);
                      },
                isPrimary: true,
                isLoading: isAudioPlaying && audioDuration == Duration.zero,
              ),
              _buildControlButton(
                context,
                icon: Icons.skip_next,
                onPressed: onNextStep,
                isPrimary: false,
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Estado del audio
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _getStatusColor(context, isAudioPlaying, autoAdvance)
                  .withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _getStatusColor(context, isAudioPlaying, autoAdvance)
                    .withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getStatusIcon(isAudioPlaying, autoAdvance),
                  size: 14,
                  color: _getStatusColor(context, isAudioPlaying, autoAdvance),
                ),
                const SizedBox(width: 6),
                Text(
                  _getStatusText(isAudioPlaying, autoAdvance),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color:
                        _getStatusColor(context, isAudioPlaying, autoAdvance),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
    required bool isPrimary,
    bool isLoading = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: isPrimary ? AppTheme.primaryGradient : null,
        color: isPrimary ? null : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: AppTheme.primaryBlue.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Icon(
                icon,
                size: isPrimary ? 28 : 24,
                color: isPrimary
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface,
              ),
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: isPrimary
              ? Colors.white
              : Theme.of(context).colorScheme.onSurface,
          padding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Color _getStatusColor(
      BuildContext context, bool isAudioPlaying, bool autoAdvance) {
    if (isAudioPlaying && autoAdvance) {
      return AppTheme.primaryBlue;
    } else if (autoAdvance) {
      return AppTheme.secondaryGold;
    } else {
      return Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
    }
  }

  IconData _getStatusIcon(bool isAudioPlaying, bool autoAdvance) {
    if (isAudioPlaying && autoAdvance) {
      return Icons.play_circle_filled;
    } else if (autoAdvance) {
      return Icons.pause_circle_filled;
    } else {
      return Icons.volume_off;
    }
  }

  String _getStatusText(bool isAudioPlaying, bool autoAdvance) {
    if (isAudioPlaying && autoAdvance) {
      return 'Reproduciendo automáticamente';
    } else if (autoAdvance) {
      return 'Auto-avance activado - Pausado';
    } else {
      return 'Auto-avance desactivado';
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}

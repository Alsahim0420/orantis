import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/coronilla/coronilla_bloc.dart';
import '../bloc/coronilla/coronilla_event.dart';
import '../bloc/coronilla/coronilla_state.dart';
import '../widgets/glass_card.dart';
import '../widgets/audio_controls.dart';
import '../widgets/custom_app_bar.dart';

class CoronillaRezarPage extends StatelessWidget {
  const CoronillaRezarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoronillaBloc()..add(LoadCoronillaSteps()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Rezando la Coronilla',
          showBackButton: true,
        ),
        body: BlocBuilder<CoronillaBloc, CoronillaState>(
          builder: (context, state) {
            if (state is CoronillaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CoronillaStepsLoaded) {
              return _buildRezarView(context, state);
            } else if (state is CoronillaError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return const Center(
              child: Text('Estado no manejado'),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRezarView(BuildContext context, CoronillaStepsLoaded state) {
    final currentStep = state.steps[state.currentStepIndex];
    final progress = (state.currentStepIndex + 1) / state.steps.length;
    final isLastStep = state.currentStepIndex == state.steps.length - 1;
    final isFirstStep = state.currentStepIndex == 0;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.secondary.withOpacity(0.05),
          ],
        ),
      ),
      child: Column(
        children: [
          // Barra de progreso
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Paso ${state.currentStepIndex + 1} de ${state.steps.length}',
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor:
                      Theme.of(context).colorScheme.surface.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),

          // Contenido principal
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Título del paso
                  GlassCard(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _getStepIcon(currentStep),
                              size: 32,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            currentStep.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Contenido de la oración
                  GlassCard(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Text(
                            currentStep.content,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1.6,
                                      fontSize: 18,
                                    ),
                            textAlign: TextAlign.justify,
                          ),
                          if (currentStep.decadeNumber != null) ...[
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Decena ${currentStep.decadeNumber}',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                          if (currentStep.repetitionNumber != null &&
                              currentStep.repetitionNumber! > 1) ...[
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Repetición ${currentStep.repetitionNumber}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Controles de Audio
                  AudioControls<CoronillaBloc>(currentStep: currentStep),
                  const SizedBox(height: 24),

                  const SizedBox(height: 32),

                  // Botones de navegación
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: isFirstStep
                              ? null
                              : () {
                                  context
                                      .read<CoronillaBloc>()
                                      .add(PreviousStep());
                                },
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Anterior'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            foregroundColor:
                                Theme.of(context).colorScheme.onSurface,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: isLastStep
                              ? () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          '¡Felicidades! Has terminado la Coronilla.'),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                  Future.delayed(
                                      const Duration(milliseconds: 600), () {
                                    context.go('/coronilla');
                                  });
                                }
                              : () {
                                  context.read<CoronillaBloc>().add(NextStep());
                                },
                          icon: Icon(
                              isLastStep ? Icons.check : Icons.arrow_forward),
                          label: Text(isLastStep ? 'Finalizar' : 'Siguiente'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isLastStep
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  if (isLastStep) ...[
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.read<CoronillaBloc>().add(ResetCoronilla());
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Rezar de Nuevo'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getStepIcon(dynamic step) {
    if (step.title.contains('Señal de la Cruz')) {
      return Icons.add;
    } else if (step.title.contains('Padre Nuestro')) {
      return Icons.person;
    } else if (step.title.contains('Ave María')) {
      return Icons.favorite;
    } else if (step.title.contains('Credo')) {
      return Icons.church;
    } else if (step.title.contains('Decena')) {
      return Icons.auto_awesome;
    } else if (step.title.contains('Oración Final')) {
      return Icons.celebration;
    } else {
      return Icons.auto_awesome;
    }
  }
}

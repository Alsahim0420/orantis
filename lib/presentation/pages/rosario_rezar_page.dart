import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme/app_theme.dart';
import '../../domain/entities/rosario_entity.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/audio_controls.dart';
import '../widgets/glass_card.dart';
import '../bloc/rosario/rosario_bloc.dart';
import '../bloc/rosario/rosario_event.dart';
import '../bloc/rosario/rosario_state.dart';

class RosarioRezarPage extends StatelessWidget {
  final String tipoMisterio;
  const RosarioRezarPage({super.key, required this.tipoMisterio});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RosarioBloc()..add(LoadRosarioSteps(tipoMisterio)),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Rosario - $tipoMisterio',
          showBackButton: true,
        ),
        body: BlocBuilder<RosarioBloc, RosarioState>(
          builder: (context, state) {
            if (state is RosarioLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
                ),
              );
            } else if (state is RosarioStepsLoaded) {
              return _buildRezarView(context, state);
            } else if (state is RosarioError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.message,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('Estado no manejado'));
          },
        ),
      ),
    );
  }

  Widget _buildRezarView(BuildContext context, RosarioStepsLoaded state) {
    final progress = (state.pasoActual + 1) / state.pasos.length;
    final isLastStep = state.pasoActual == state.pasos.length - 1;
    final isFirstStep = state.pasoActual == 0;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
            Theme.of(context).colorScheme.background,
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
                      'Paso ${state.pasoActual + 1} de ${state.pasos.length}',
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
                  // Título del paso actual
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
                              _getStepIcon(state),
                              size: 32,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _obtenerTituloActual(state),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          if (state.decenaActual > 0) ...[
                            const SizedBox(height: 12),
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
                                'Decena ${state.decenaActual}',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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

                  // Contenido de la oración
                  GlassCard(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Text(
                            _obtenerOracionActual(state),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1.6,
                                      fontSize: 18,
                                    ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Controles de Audio
                  AudioControls<RosarioBloc>(
                      currentStep: _buildStepObject(state)),
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
                                      .read<RosarioBloc>()
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
                                  _mostrarCompletado(context);
                                }
                              : () {
                                  context.read<RosarioBloc>().add(NextStep());
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
                          context
                              .read<RosarioBloc>()
                              .add(LoadRosarioSteps(tipoMisterio));
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

  IconData _getStepIcon(RosarioStepsLoaded state) {
    final paso = state.pasos[state.pasoActual];
    if (paso == 'Oración Inicial') {
      return Icons.add;
    } else if (paso == 'Padre Nuestro') {
      return Icons.person;
    } else if (paso.startsWith('Ave María')) {
      return Icons.favorite;
    } else if (paso == 'Gloria') {
      return Icons.auto_awesome;
    } else if (paso == 'Oración de Fátima') {
      return Icons.celebration;
    } else if (paso == 'Oración Final') {
      return Icons.celebration;
    } else if (paso.startsWith('Decena')) {
      return Icons.auto_awesome;
    } else {
      return Icons.auto_awesome;
    }
  }

  void _mostrarCompletado(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              '¡Completado!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: const Text(
          'Has completado el Santo Rosario. Que la Virgen María interceda por ti.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                'Finalizar',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helpers para obtener el texto y título del paso actual
  String _obtenerOracionActual(RosarioStepsLoaded state) {
    final paso = state.pasos[state.pasoActual];
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

  String _obtenerTituloActual(RosarioStepsLoaded state) {
    final paso = state.pasos[state.pasoActual];
    if (paso.startsWith('Decena')) {
      final misterios =
          RosarioData.getMisterios(_parseTipoMisterio(state.tipoMisterio));
      final decenaIndex = int.parse(paso.split(' ')[1]) - 1;
      return misterios[decenaIndex].descripcion;
    }
    return paso;
  }

  dynamic _buildStepObject(RosarioStepsLoaded state) {
    // Devuelve un objeto con title y content para AudioControls
    final paso = state.pasos[state.pasoActual];
    return {
      'title': paso,
      'content': _obtenerOracionActual(state),
      'decadeNumber':
          paso.startsWith('Decena') ? int.parse(paso.split(' ')[1]) : null,
      'repetitionNumber':
          paso.startsWith('Ave María') ? int.parse(paso.split(' ')[2]) : null,
    };
  }

  dynamic _parseTipoMisterio(String tipo) {
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
}

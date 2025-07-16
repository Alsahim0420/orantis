import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/novenas_data.dart';
import '../../domain/entities/novena_entity.dart';
import '../bloc/novena/novena_bloc.dart';
import '../bloc/novena/novena_event.dart';
import '../bloc/novena/novena_state.dart';
import '../widgets/glass_card.dart';
import '../widgets/custom_app_bar.dart';

class NovenaRezarPage extends StatelessWidget {
  final String novenaId;

  const NovenaRezarPage({
    super.key,
    required this.novenaId,
  });

  @override
  Widget build(BuildContext context) {
    final novena =
        NovenasData.getAllNovenas().firstWhere((n) => n.id == novenaId);

    return BlocProvider(
      create: (context) => NovenaBloc()..add(LoadNovena(novena)),
      child: Scaffold(
        appBar: CustomAppBar(
          title: novena.title,
          showBackButton: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.background,
              ],
            ),
          ),
          child: SafeArea(
            child: BlocBuilder<NovenaBloc, NovenaState>(
              builder: (context, state) {
                if (state is NovenaLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is NovenaLoaded) {
                  return _NovenaContent(
                    novena: state.novena,
                    currentDay: state.currentDay,
                    isPlaying: state.isPlaying,
                    autoAdvance: state.autoAdvance,
                  );
                }

                return const Center(
                  child: Text('Error al cargar la novena'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _NovenaContent extends StatelessWidget {
  final Novena novena;
  final int currentDay;
  final bool isPlaying;
  final bool autoAdvance;

  const _NovenaContent({
    required this.novena,
    required this.currentDay,
    required this.isPlaying,
    required this.autoAdvance,
  });

  @override
  Widget build(BuildContext context) {
    final currentNovenaDay = novena.days[currentDay - 1];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress indicator
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Día $currentDay de ${novena.days.length}',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                      Text(
                        '${((currentDay / novena.days.length) * 100).round()}%',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: currentDay / novena.days.length,
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Current day card
            GlassCard(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentNovenaDay.title,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Intención:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      currentNovenaDay.intention,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Prayer card
            GlassCard(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  currentNovenaDay.prayer,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                        fontSize: 18,
                      ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Reflection card
            if (currentNovenaDay.reflection != null) ...[
              GlassCard(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reflexión:',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currentNovenaDay.reflection!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],

            // Navigation buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: currentDay > 1
                        ? () {
                            context.read<NovenaBloc>().add(PreviousDay());
                          }
                        : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Anterior'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
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
                    onPressed: currentDay < novena.days.length
                        ? () {
                            context.read<NovenaBloc>().add(NextDay());
                          }
                        : null,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Siguiente'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
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
          ],
        ),
      ),
    );
  }
}

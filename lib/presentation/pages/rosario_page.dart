import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme/app_theme.dart';
import '../../domain/entities/rosario_entity.dart';
import '../widgets/custom_app_bar.dart';

class RosarioPage extends StatelessWidget {
  const RosarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final misterioDelDia = RosarioData.getMisterioDelDia();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'El Santo Rosario',
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryBlue.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'El Santo Rosario',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Selecciona los misterios que quieres rezar',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  // Misterio del día
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.secondaryGold,
                          AppTheme.secondaryGold.withOpacity(0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.secondaryGold.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.today,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Misterio del Día',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getMisterioDelDiaText(misterioDelDia),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => context
                                .go('/rosario/rezar/${misterioDelDia.name}'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppTheme.secondaryGold,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Rezar Ahora',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Otros Misterios',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 16),
                  // Lista de misterios
                  _MisterioCard(
                    titulo: 'Misterios Gozosos',
                    subtitulo: 'Lunes y Sábado',
                    icon: Icons.favorite,
                    color: AppTheme.primaryBlue,
                    onTap: () => context.go('/rosario/rezar/gozosos'),
                  ),
                  const SizedBox(height: 12),
                  _MisterioCard(
                    titulo: 'Misterios Dolorosos',
                    subtitulo: 'Martes y Viernes',
                    icon: Icons.favorite_border,
                    color: AppTheme.accentRed,
                    onTap: () => context.go('/rosario/rezar/dolorosos'),
                  ),
                  const SizedBox(height: 12),
                  _MisterioCard(
                    titulo: 'Misterios Gloriosos',
                    subtitulo: 'Miércoles y Domingo',
                    icon: Icons.auto_awesome,
                    color: AppTheme.accentPurple,
                    onTap: () => context.go('/rosario/rezar/gloriosos'),
                  ),
                  const SizedBox(height: 12),
                  _MisterioCard(
                    titulo: 'Misterios Luminosos',
                    subtitulo: 'Jueves',
                    icon: Icons.lightbulb,
                    color: AppTheme.secondaryGold,
                    onTap: () => context.go('/rosario/rezar/luminosos'),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getMisterioDelDiaText(TipoMisterio tipo) {
    switch (tipo) {
      case TipoMisterio.gozosos:
        return 'Misterios Gozosos';
      case TipoMisterio.dolorosos:
        return 'Misterios Dolorosos';
      case TipoMisterio.gloriosos:
        return 'Misterios Gloriosos';
      case TipoMisterio.luminosos:
        return 'Misterios Luminosos';
    }
  }
}

class _MisterioCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MisterioCard({
    required this.titulo,
    required this.subtitulo,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitulo,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.color
                              ?.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.color
                  ?.withOpacity(0.5),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

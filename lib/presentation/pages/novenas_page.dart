import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme/app_theme.dart';
import '../../data/novenas_data.dart';
import '../../domain/entities/novena_entity.dart';
import '../widgets/glass_card.dart';
import '../widgets/custom_app_bar.dart';

class NovenasPage extends StatelessWidget {
  const NovenasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final novenas = NovenasData.getAllNovenas();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Novenas',
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  'Devociones de Nueve Días',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Reza con fe y devoción estas novenas especiales',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.7),
                      ),
                ),
                const SizedBox(height: 24),

                // Novenas list
                Expanded(
                  child: ListView.builder(
                    itemCount: novenas.length,
                    itemBuilder: (context, index) {
                      final novena = novenas[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _NovenaCard(novena: novena),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NovenaCard extends StatelessWidget {
  final Novena novena;

  const _NovenaCard({required this.novena});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: InkWell(
        onTap: () {
          context.go('/novena/${novena.id}');
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Icono según la categoría
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: _getGradientForCategory(novena.category),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      _getIconForCategory(novena.category),
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          novena.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          novena.subtitle,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.7),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                novena.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.4,
                    ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                          _getCategoryColor(novena.category).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getCategoryLabel(novena.category),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: _getCategoryColor(novena.category),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${novena.days.length} días',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  LinearGradient _getGradientForCategory(String category) {
    switch (category) {
      case 'mariana':
        return AppTheme.primaryGradient;
      case 'santos':
        return AppTheme.secondaryGradient;
      case 'jesus':
        return AppTheme.tertiaryGradient;
      default:
        return AppTheme.primaryGradient;
    }
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'mariana':
        return Icons.favorite;
      case 'santos':
        return Icons.person;
      case 'jesus':
        return Icons.church;
      default:
        return Icons.church;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'mariana':
        return AppTheme.primaryBlue;
      case 'santos':
        return AppTheme.secondaryGold;
      case 'jesus':
        return AppTheme.accentPurple;
      default:
        return AppTheme.primaryBlue;
    }
  }

  String _getCategoryLabel(String category) {
    switch (category) {
      case 'mariana':
        return 'Mariana';
      case 'santos':
        return 'Santos';
      case 'jesus':
        return 'Jesús';
      default:
        return 'General';
    }
  }
}

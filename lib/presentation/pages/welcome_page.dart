import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme/app_theme.dart';
import '../widgets/animated_prayer_card.dart';
import '../widgets/settings_modal.dart';
import '../bloc/settings/settings_bloc.dart';
import '../bloc/theme/theme_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.appBarGradient,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 60,
            title: Text(
              'Orantis',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            centerTitle: true,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 22,
                  ),
                  onPressed: () => _showSettingsPopup(context),
                ),
              ),
            ],
          ),
        ),
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
            padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header section
                const SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryBlue.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite,
                    size: 60,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  'Bienvenido a Orantis',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                Text(
                  'Tu compañero espiritual para la oración diaria',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                // Prayer options
                AnimatedPrayerCard(
                  title: 'El Santo Rosario',
                  subtitle: 'Reza con devoción y propósito',
                  icon: Icons.auto_awesome,
                  gradient: AppTheme.primaryGradient,
                  onTap: () => context.go('/rosario'),
                ),
                const SizedBox(height: 20),
                AnimatedPrayerCard(
                  title: 'La Coronilla',
                  subtitle: 'La Divina Misericordia',
                  icon: Icons.celebration,
                  gradient: AppTheme.secondaryGradient,
                  onTap: () => context.go('/coronilla'),
                ),
                const SizedBox(height: 20),
                AnimatedPrayerCard(
                  title: 'Novenas',
                  subtitle: 'Devociones de nueve días',
                  icon: Icons.church,
                  gradient: AppTheme.tertiaryGradient,
                  onTap: () => context.go('/novenas'),
                ),

                // Footer
                const SizedBox(height: 40),
                Text(
                  '"Orad sin cesar" - 1 Tesalonicenses 5:17',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.color
                            ?.withOpacity(0.7),
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSettingsPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SettingsBloc()..add(LoadSettings()),
            ),
            BlocProvider.value(
              value: BlocProvider.of<ThemeBloc>(context),
            ),
          ],
          child: const SettingsModal(),
        );
      },
    );
  }
}

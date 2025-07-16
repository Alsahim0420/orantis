import 'package:go_router/go_router.dart';
import '../presentation/pages/welcome_page.dart';
import '../presentation/pages/rosario_page.dart';
import '../presentation/pages/coronilla_page.dart';
import '../presentation/pages/onboarding_page.dart';
import '../presentation/pages/splash_screen.dart';
import '../presentation/pages/rosario_rezar_page.dart';
import '../presentation/pages/coronilla_rezar_page.dart';
import '../presentation/pages/novenas_page.dart';
import '../presentation/pages/novena_rezar_page.dart';
import '../presentation/pages/notifications_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/',
      name: 'welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/rosario',
      name: 'rosario',
      builder: (context, state) => const RosarioPage(),
    ),
    GoRoute(
      path: '/rosario/rezar/:tipo',
      name: 'rosario_rezar',
      builder: (context, state) => RosarioRezarPage(
        tipoMisterio: state.pathParameters['tipo']!,
      ),
    ),
    GoRoute(
      path: '/coronilla',
      name: 'coronilla',
      builder: (context, state) => const CoronillaPage(),
    ),
    GoRoute(
      path: '/coronilla/rezar',
      name: 'coronilla_rezar',
      builder: (context, state) => const CoronillaRezarPage(),
    ),
    GoRoute(
      path: '/novenas',
      name: 'novenas',
      builder: (context, state) => const NovenasPage(),
    ),
    GoRoute(
      path: '/novena/:id',
      name: 'novena_rezar',
      builder: (context, state) => NovenaRezarPage(
        novenaId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/notifications',
      name: 'notifications',
      builder: (context, state) => const NotificationsPage(),
    ),
  ],
);

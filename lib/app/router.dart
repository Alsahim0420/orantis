import 'package:go_router/go_router.dart';
import '../presentation/pages/welcome_page.dart';
import '../presentation/pages/rosario_page.dart';
import '../presentation/pages/coronilla_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
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
      path: '/coronilla',
      name: 'coronilla',
      builder: (context, state) => const CoronillaPage(),
    ),
  ],
);

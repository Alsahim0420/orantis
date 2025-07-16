import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/router.dart';
import 'app/theme/app_theme.dart';
import 'presentation/bloc/theme/theme_bloc.dart';
import 'presentation/bloc/notifications/notifications_bloc.dart';
import 'domain/usecases/get_notifications_usecase.dart';
import 'domain/usecases/save_notification_usecase.dart';
import 'domain/usecases/delete_notification_usecase.dart';
import 'data/repositories/notification_repository_impl.dart';

void main() {
  runApp(const OrantisApp());
}

class OrantisApp extends StatelessWidget {
  const OrantisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(LoadTheme()),
        ),
        BlocProvider(
          create: (context) {
            final repository = NotificationRepositoryImpl();
            return NotificationsBloc(
              getNotifications: GetNotificationsUseCase(repository),
              saveNotification: SaveNotificationUseCase(repository),
              deleteNotification: DeleteNotificationUseCase(repository),
            )..add(LoadNotifications());
          },
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Orantis',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state is ThemeLoaded
                ? (state.isDarkMode ? ThemeMode.dark : ThemeMode.light)
                : ThemeMode.system,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}

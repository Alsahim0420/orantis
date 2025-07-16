import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/prayer_notification.dart';
import '../../../domain/usecases/get_notifications_usecase.dart';
import '../../../domain/usecases/save_notification_usecase.dart';
import '../../../domain/usecases/delete_notification_usecase.dart';

// Events
abstract class NotificationsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadNotifications extends NotificationsEvent {}

class AddNotification extends NotificationsEvent {
  final PrayerNotification notification;

  AddNotification(this.notification);

  @override
  List<Object?> get props => [notification];
}

class UpdateNotification extends NotificationsEvent {
  final PrayerNotification notification;

  UpdateNotification(this.notification);

  @override
  List<Object?> get props => [notification];
}

class DeleteNotification extends NotificationsEvent {
  final String id;

  DeleteNotification(this.id);

  @override
  List<Object?> get props => [id];
}

class ToggleNotification extends NotificationsEvent {
  final String id;
  final bool isActive;

  ToggleNotification(this.id, this.isActive);

  @override
  List<Object?> get props => [id, isActive];
}

// States
abstract class NotificationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationsLoading extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final List<PrayerNotification> notifications;

  NotificationsLoaded(this.notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationsError extends NotificationsState {
  final String message;

  NotificationsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetNotificationsUseCase getNotifications;
  final SaveNotificationUseCase saveNotification;
  final DeleteNotificationUseCase deleteNotification;

  NotificationsBloc({
    required this.getNotifications,
    required this.saveNotification,
    required this.deleteNotification,
  }) : super(NotificationsLoading()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<AddNotification>(_onAddNotification);
    on<UpdateNotification>(_onUpdateNotification);
    on<DeleteNotification>(_onDeleteNotification);
    on<ToggleNotification>(_onToggleNotification);
  }

  Future<void> _onLoadNotifications(
      LoadNotifications event, Emitter<NotificationsState> emit) async {
    try {
      final notifications = await getNotifications();
      emit(NotificationsLoaded(notifications));
    } catch (e) {
      emit(NotificationsError('Error al cargar notificaciones'));
    }
  }

  Future<void> _onAddNotification(
      AddNotification event, Emitter<NotificationsState> emit) async {
    try {
      await saveNotification(event.notification);
      final notifications = await getNotifications();
      emit(NotificationsLoaded(notifications));
    } catch (e) {
      emit(NotificationsError('Error al agregar notificación'));
    }
  }

  Future<void> _onUpdateNotification(
      UpdateNotification event, Emitter<NotificationsState> emit) async {
    try {
      await saveNotification(event.notification);
      final notifications = await getNotifications();
      emit(NotificationsLoaded(notifications));
    } catch (e) {
      emit(NotificationsError('Error al actualizar notificación'));
    }
  }

  Future<void> _onDeleteNotification(
      DeleteNotification event, Emitter<NotificationsState> emit) async {
    try {
      await deleteNotification(event.id);
      final notifications = await getNotifications();
      emit(NotificationsLoaded(notifications));
    } catch (e) {
      emit(NotificationsError('Error al eliminar notificación'));
    }
  }

  Future<void> _onToggleNotification(
      ToggleNotification event, Emitter<NotificationsState> emit) async {
    try {
      if (state is NotificationsLoaded) {
        final currentNotifications =
            (state as NotificationsLoaded).notifications;
        final notificationIndex =
            currentNotifications.indexWhere((n) => n.id == event.id);

        if (notificationIndex >= 0) {
          final notification = currentNotifications[notificationIndex];
          final updatedNotification =
              notification.copyWith(isActive: event.isActive);
          await saveNotification(updatedNotification);

          final notifications = await getNotifications();
          emit(NotificationsLoaded(notifications));
        }
      }
    } catch (e) {
      emit(NotificationsError('Error al cambiar estado de notificación'));
    }
  }
}

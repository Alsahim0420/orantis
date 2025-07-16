import '../repositories/notification_repository.dart';

class DeleteNotificationUseCase {
  final NotificationRepository repository;

  DeleteNotificationUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.cancelNotification(id);
    await repository.deleteNotification(id);
  }
}

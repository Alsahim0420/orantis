import '../entities/prayer_notification.dart';
import '../repositories/notification_repository.dart';

class SaveNotificationUseCase {
  final NotificationRepository repository;

  SaveNotificationUseCase(this.repository);

  Future<void> call(PrayerNotification notification) async {
    await repository.saveNotification(notification);
    if (notification.isActive) {
      await repository.scheduleNotification(notification);
    }
  }
}

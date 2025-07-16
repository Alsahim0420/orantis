import '../entities/prayer_notification.dart';
import '../repositories/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<List<PrayerNotification>> call() async {
    return await repository.getNotifications();
  }
}

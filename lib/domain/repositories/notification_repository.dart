import '../entities/prayer_notification.dart';

abstract class NotificationRepository {
  Future<List<PrayerNotification>> getNotifications();
  Future<void> saveNotification(PrayerNotification notification);
  Future<void> deleteNotification(String id);
  Future<void> updateNotification(PrayerNotification notification);
  Future<void> scheduleNotification(PrayerNotification notification);
  Future<void> cancelNotification(String id);
  Future<void> cancelAllNotifications();
  Future<bool> requestPermissions();
}

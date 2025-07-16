import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../../domain/entities/prayer_notification.dart';
import '../../domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  static const String _notificationsKey = 'prayer_notifications';

  final FlutterLocalNotificationsPlugin _notificationsPlugin;
  bool _isInitialized = false;

  NotificationRepositoryImpl()
      : _notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> _initializeNotifications() async {
    if (_isInitialized) return;

    try {
      tz.initializeTimeZones();

      const androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const iosSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );

      const initSettings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

      await _notificationsPlugin.initialize(
        initSettings,
        onDidReceiveNotificationResponse: _onNotificationTapped,
      );

      _isInitialized = true;
    } catch (e) {
      // Si falla la inicialización, no hacer nada
      debugPrint('Error initializing notifications: $e');
    }
  }

  void _onNotificationTapped(NotificationResponse response) {
    // Aquí puedes manejar cuando el usuario toca la notificación
    // Por ejemplo, navegar a la página correspondiente
  }

  @override
  Future<List<PrayerNotification>> getNotifications() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final notificationsJson = prefs.getStringList(_notificationsKey) ?? [];

      return notificationsJson
          .map((json) => PrayerNotification.fromJson(jsonDecode(json)))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> saveNotification(PrayerNotification notification) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final notifications = await getNotifications();

      // Buscar si ya existe una notificación con el mismo ID
      final existingIndex =
          notifications.indexWhere((n) => n.id == notification.id);

      if (existingIndex >= 0) {
        notifications[existingIndex] = notification;
      } else {
        notifications.add(notification);
      }

      final notificationsJson =
          notifications.map((n) => jsonEncode(n.toJson())).toList();

      await prefs.setStringList(_notificationsKey, notificationsJson);
    } catch (e) {
      // Manejar error
    }
  }

  @override
  Future<void> deleteNotification(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final notifications = await getNotifications();

      notifications.removeWhere((n) => n.id == id);

      final notificationsJson =
          notifications.map((n) => jsonEncode(n.toJson())).toList();

      await prefs.setStringList(_notificationsKey, notificationsJson);
    } catch (e) {
      // Manejar error
    }
  }

  @override
  Future<void> updateNotification(PrayerNotification notification) async {
    await saveNotification(notification);
  }

  @override
  Future<void> scheduleNotification(PrayerNotification notification) async {
    if (!notification.isActive) return;

    try {
      await _initializeNotifications();

      // Cancelar notificación existente si existe
      await cancelNotification(notification.id);

      // Programar notificaciones para cada día seleccionado
      for (int dayIndex = 0;
          dayIndex < notification.daysOfWeek.length;
          dayIndex++) {
        if (notification.daysOfWeek[dayIndex]) {
          await _scheduleNotificationForDay(notification, dayIndex);
        }
      }
    } catch (e) {
      // Manejar error
    }
  }

  Future<void> _scheduleNotificationForDay(
      PrayerNotification notification, int dayIndex) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      notification.hour,
      notification.minute,
    );

    // Ajustar al día de la semana correcto
    while (scheduledDate.weekday != dayIndex + 1) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    // Si la hora ya pasó hoy, programar para la próxima semana
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 7));
    }

    const androidDetails = AndroidNotificationDetails(
      'prayer_notifications',
      'Recordatorios de Oración',
      channelDescription: 'Notificaciones para recordar rezar',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      color: Color(0xFF1E3A8A),
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notificationsPlugin.zonedSchedule(
      int.parse('${notification.id.hashCode}$dayIndex'),
      notification.title,
      notification.body,
      scheduledDate,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  @override
  Future<void> cancelNotification(String id) async {
    try {
      await _initializeNotifications();

      final notifications = await getNotifications();
      final notification = notifications.firstWhere((n) => n.id == id);

      // Cancelar notificaciones para todos los días
      for (int dayIndex = 0;
          dayIndex < notification.daysOfWeek.length;
          dayIndex++) {
        await _notificationsPlugin.cancel(int.parse('${id.hashCode}$dayIndex'));
      }
    } catch (e) {
      // Manejar error
    }
  }

  @override
  Future<void> cancelAllNotifications() async {
    try {
      await _initializeNotifications();
      await _notificationsPlugin.cancelAll();
    } catch (e) {
      // Manejar error
    }
  }

  @override
  Future<bool> requestPermissions() async {
    try {
      await _initializeNotifications();

      final androidGranted = await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();

      final iosGranted = await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );

      return (androidGranted ?? false) && (iosGranted ?? false);
    } catch (e) {
      return false;
    }
  }
}

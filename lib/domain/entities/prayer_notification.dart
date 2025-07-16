import 'package:equatable/equatable.dart';

enum PrayerType {
  coronilla,
  rosario,
  novenaInmaculada,
  novenaSanJose,
  novenaGuadalupe,
  novenaMisericordia,
  novenaSanAntonio,
  novenaFatima,
}

class PrayerNotification extends Equatable {
  final String id;
  final String title;
  final String body;
  final int hour;
  final int minute;
  final List<bool>
      daysOfWeek; // [Lunes, Martes, Miércoles, Jueves, Viernes, Sábado, Domingo]
  final PrayerType prayerType;
  final bool isActive;

  const PrayerNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.hour,
    required this.minute,
    required this.daysOfWeek,
    required this.prayerType,
    this.isActive = true,
  });

  PrayerNotification copyWith({
    String? id,
    String? title,
    String? body,
    int? hour,
    int? minute,
    List<bool>? daysOfWeek,
    PrayerType? prayerType,
    bool? isActive,
  }) {
    return PrayerNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      prayerType: prayerType ?? this.prayerType,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'hour': hour,
      'minute': minute,
      'daysOfWeek': daysOfWeek,
      'prayerType': prayerType.name,
      'isActive': isActive,
    };
  }

  factory PrayerNotification.fromJson(Map<String, dynamic> json) {
    return PrayerNotification(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      hour: json['hour'],
      minute: json['minute'],
      daysOfWeek: List<bool>.from(json['daysOfWeek']),
      prayerType: PrayerType.values.firstWhere(
        (e) => e.name == json['prayerType'],
      ),
      isActive: json['isActive'] ?? true,
    );
  }

  String get prayerTypeName {
    switch (prayerType) {
      case PrayerType.coronilla:
        return 'Coronilla';
      case PrayerType.rosario:
        return 'Rosario';
      case PrayerType.novenaInmaculada:
        return 'Inmaculada Concepción';
      case PrayerType.novenaSanJose:
        return 'San José';
      case PrayerType.novenaGuadalupe:
        return 'Virgen de Guadalupe';
      case PrayerType.novenaMisericordia:
        return 'Divina Misericordia';
      case PrayerType.novenaSanAntonio:
        return 'San Antonio';
      case PrayerType.novenaFatima:
        return 'Virgen de Fátima';
    }
  }

  String get timeString {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }

  String get daysString {
    final days = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
    final activeDays = <String>[];

    for (int i = 0; i < daysOfWeek.length; i++) {
      if (daysOfWeek[i]) {
        activeDays.add(days[i]);
      }
    }

    if (activeDays.isEmpty) {
      return 'Nunca';
    } else if (activeDays.length == 7) {
      return 'Todos los días';
    } else if (activeDays.length == 5 &&
        daysOfWeek[0] &&
        daysOfWeek[1] &&
        daysOfWeek[2] &&
        daysOfWeek[3] &&
        daysOfWeek[4]) {
      return 'Días laborables';
    } else if (activeDays.length == 2 && daysOfWeek[5] && daysOfWeek[6]) {
      return 'Fines de semana';
    } else {
      return activeDays.join(', ');
    }
  }

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        hour,
        minute,
        daysOfWeek,
        prayerType,
        isActive,
      ];
}

import 'package:equatable/equatable.dart';

class Novena extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final List<NovenaDay> days;
  final String category; // 'mariana', 'santos', 'jesus', etc.
  final DateTime? startDate; // Para novenas con fechas específicas
  final bool isActive; // Si está disponible actualmente

  const Novena({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.days,
    required this.category,
    this.startDate,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        description,
        imagePath,
        days,
        category,
        startDate,
        isActive,
      ];
}

class NovenaDay extends Equatable {
  final int dayNumber;
  final String title;
  final String prayer;
  final String intention;
  final String? reflection;

  const NovenaDay({
    required this.dayNumber,
    required this.title,
    required this.prayer,
    required this.intention,
    this.reflection,
  });

  @override
  List<Object?> get props => [dayNumber, title, prayer, intention, reflection];
}

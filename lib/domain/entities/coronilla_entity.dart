class CoronillaEntity {
  final String title;
  final String description;
  final List<CoronillaDecadeEntity> decades;
  final List<String> openingPrayers;
  final List<String> closingPrayers;

  const CoronillaEntity({
    required this.title,
    required this.description,
    required this.decades,
    required this.openingPrayers,
    required this.closingPrayers,
  });
}

class CoronillaDecadeEntity {
  final int number;
  final String title;
  final String mystery;
  final String prayer;
  final int repetitions;

  const CoronillaDecadeEntity({
    required this.number,
    required this.title,
    required this.mystery,
    required this.prayer,
    required this.repetitions,
  });
}

class CoronillaStepEntity {
  final String title;
  final String content;
  final bool isPrayer;
  final int? decadeNumber;
  final int? repetitionNumber;

  const CoronillaStepEntity({
    required this.title,
    required this.content,
    this.isPrayer = false,
    this.decadeNumber,
    this.repetitionNumber,
  });
}

enum TipoMisterio {
  gozosos,
  dolorosos,
  gloriosos,
  luminosos,
}

enum DiaSemana {
  lunes,
  martes,
  miercoles,
  jueves,
  viernes,
  sabado,
  domingo,
}

class Misterio {
  final String titulo;
  final String descripcion;
  final String oracion;
  final TipoMisterio tipo;

  const Misterio({
    required this.titulo,
    required this.descripcion,
    required this.oracion,
    required this.tipo,
  });
}

class Decena {
  final Misterio misterio;
  final int numero;
  final List<String> padrenuestros;
  final List<String> avemarias;
  final String gloria;

  const Decena({
    required this.misterio,
    required this.numero,
    required this.padrenuestros,
    required this.avemarias,
    required this.gloria,
  });
}

class Rosario {
  final List<Decena> decenas;
  final String oracionInicial;
  final String oracionFinal;
  final TipoMisterio tipoMisterio;

  const Rosario({
    required this.decenas,
    required this.oracionInicial,
    required this.oracionFinal,
    required this.tipoMisterio,
  });
}

// Datos del Rosario
class RosarioData {
  static const String oracionInicial = '''
En el nombre del Padre, y del Hijo, y del Espíritu Santo. Amén.

V. Dios mío, ven en mi auxilio.
R. Señor, date prisa en socorrerme.

Gloria al Padre, al Hijo y al Espíritu Santo.
Como era en el principio, ahora y siempre, por los siglos de los siglos. Amén.
''';

  static const String oracionFinal = '''
Dios te salve, María, Hija de Dios Padre;
Dios te salve, María, Madre de Dios Hijo;
Dios te salve, María, Esposa del Espíritu Santo;
Dios te salve, María, Templo y Sagrario de la Santísima Trinidad.

Gloria al Padre, al Hijo y al Espíritu Santo.
Como era en el principio, ahora y siempre, por los siglos de los siglos. Amén.
''';

  static const String padrenuestro = '''
Padre nuestro, que estás en el cielo,
santificado sea tu Nombre;
venga a nosotros tu reino;
hágase tu voluntad en la tierra como en el cielo.
Danos hoy nuestro pan de cada día;
perdona nuestras ofensas,
como también nosotros perdonamos a los que nos ofenden;
no nos dejes caer en la tentación,
y líbranos del mal. Amén.
''';

  static const String avemaria = '''
Dios te salve, María, llena eres de gracia,
el Señor es contigo.
Bendita tú eres entre todas las mujeres,
y bendito es el fruto de tu vientre, Jesús.
Santa María, Madre de Dios,
ruega por nosotros, pecadores,
ahora y en la hora de nuestra muerte. Amén.
''';

  static const String gloria = '''
Gloria al Padre, al Hijo y al Espíritu Santo.
Como era en el principio, ahora y siempre, por los siglos de los siglos. Amén.
''';

  static const String fatima = '''
¡Oh Jesús mío! Perdona nuestros pecados, líbranos del fuego del infierno, lleva al cielo a todas las almas, especialmente a las más necesitadas de tu misericordia.
''';

  static const List<Misterio> misteriosGozosos = [
    Misterio(
      titulo: 'Primer Misterio Gozoso',
      descripcion: 'La Anunciación del Ángel a María',
      oracion: 'Por la humildad de María al aceptar ser la Madre de Dios.',
      tipo: TipoMisterio.gozosos,
    ),
    Misterio(
      titulo: 'Segundo Misterio Gozoso',
      descripcion: 'La Visitación de María a su prima Isabel',
      oracion: 'Por la caridad de María al visitar a su prima Isabel.',
      tipo: TipoMisterio.gozosos,
    ),
    Misterio(
      titulo: 'Tercer Misterio Gozoso',
      descripcion: 'El Nacimiento de Jesús en Belén',
      oracion: 'Por la pobreza de Jesús al nacer en un pesebre.',
      tipo: TipoMisterio.gozosos,
    ),
    Misterio(
      titulo: 'Cuarto Misterio Gozoso',
      descripcion: 'La Presentación de Jesús en el Templo',
      oracion: 'Por la obediencia de María y José a la ley de Dios.',
      tipo: TipoMisterio.gozosos,
    ),
    Misterio(
      titulo: 'Quinto Misterio Gozoso',
      descripcion: 'El Niño Jesús perdido y hallado en el Templo',
      oracion: 'Por la sabiduría de Jesús al enseñar en el Templo.',
      tipo: TipoMisterio.gozosos,
    ),
  ];

  static const List<Misterio> misteriosDolorosos = [
    Misterio(
      titulo: 'Primer Misterio Doloroso',
      descripcion: 'La Oración de Jesús en el Huerto',
      oracion: 'Por la aceptación de la voluntad del Padre.',
      tipo: TipoMisterio.dolorosos,
    ),
    Misterio(
      titulo: 'Segundo Misterio Doloroso',
      descripcion: 'La Flagelación de Jesús',
      oracion: 'Por la purificación de nuestros pecados.',
      tipo: TipoMisterio.dolorosos,
    ),
    Misterio(
      titulo: 'Tercer Misterio Doloroso',
      descripcion: 'La Coronación de Espinas',
      oracion: 'Por la humildad de Jesús al aceptar las burlas.',
      tipo: TipoMisterio.dolorosos,
    ),
    Misterio(
      titulo: 'Cuarto Misterio Doloroso',
      descripcion: 'Jesús carga la Cruz',
      oracion: 'Por la paciencia de Jesús al cargar la cruz.',
      tipo: TipoMisterio.dolorosos,
    ),
    Misterio(
      titulo: 'Quinto Misterio Doloroso',
      descripcion: 'La Crucifixión y Muerte de Jesús',
      oracion: 'Por el amor de Jesús al morir por nosotros.',
      tipo: TipoMisterio.dolorosos,
    ),
  ];

  static const List<Misterio> misteriosGloriosos = [
    Misterio(
      titulo: 'Primer Misterio Glorioso',
      descripcion: 'La Resurrección de Jesús',
      oracion: 'Por la victoria de Jesús sobre la muerte.',
      tipo: TipoMisterio.gloriosos,
    ),
    Misterio(
      titulo: 'Segundo Misterio Glorioso',
      descripcion: 'La Ascensión de Jesús al Cielo',
      oracion: 'Por la esperanza de nuestra ascensión al cielo.',
      tipo: TipoMisterio.gloriosos,
    ),
    Misterio(
      titulo: 'Tercer Misterio Glorioso',
      descripcion: 'La Venida del Espíritu Santo',
      oracion: 'Por el don del Espíritu Santo a la Iglesia.',
      tipo: TipoMisterio.gloriosos,
    ),
    Misterio(
      titulo: 'Cuarto Misterio Glorioso',
      descripcion: 'La Asunción de María al Cielo',
      oracion: 'Por la glorificación de María en cuerpo y alma.',
      tipo: TipoMisterio.gloriosos,
    ),
    Misterio(
      titulo: 'Quinto Misterio Glorioso',
      descripcion: 'La Coronación de María como Reina',
      oracion: 'Por la intercesión de María como Reina del Cielo.',
      tipo: TipoMisterio.gloriosos,
    ),
  ];

  static const List<Misterio> misteriosLuminosos = [
    Misterio(
      titulo: 'Primer Misterio Luminoso',
      descripcion: 'El Bautismo de Jesús en el Jordán',
      oracion: 'Por la santificación de las aguas bautismales.',
      tipo: TipoMisterio.luminosos,
    ),
    Misterio(
      titulo: 'Segundo Misterio Luminoso',
      descripcion: 'Las Bodas de Caná',
      oracion: 'Por la intercesión de María en nuestras necesidades.',
      tipo: TipoMisterio.luminosos,
    ),
    Misterio(
      titulo: 'Tercer Misterio Luminoso',
      descripcion: 'El Anuncio del Reino de Dios',
      oracion: 'Por la conversión de los pecadores.',
      tipo: TipoMisterio.luminosos,
    ),
    Misterio(
      titulo: 'Cuarto Misterio Luminoso',
      descripcion: 'La Transfiguración de Jesús',
      oracion: 'Por la transformación de nuestras vidas en Cristo.',
      tipo: TipoMisterio.luminosos,
    ),
    Misterio(
      titulo: 'Quinto Misterio Luminoso',
      descripcion: 'La Institución de la Eucaristía',
      oracion: 'Por el don de la Eucaristía y la vida sacramental.',
      tipo: TipoMisterio.luminosos,
    ),
  ];

  static TipoMisterio getMisterioDelDia() {
    final now = DateTime.now();
    final weekday = now.weekday; // 1 = lunes, 7 = domingo

    switch (weekday) {
      case 1: // lunes
        return TipoMisterio.gozosos;
      case 2: // martes
        return TipoMisterio.dolorosos;
      case 3: // miércoles
        return TipoMisterio.gloriosos;
      case 4: // jueves
        return TipoMisterio.luminosos;
      case 5: // viernes
        return TipoMisterio.dolorosos;
      case 6: // sábado
        return TipoMisterio.gozosos;
      case 7: // domingo
        return TipoMisterio.gloriosos;
      default:
        return TipoMisterio.gozosos;
    }
  }

  static List<Misterio> getMisterios(TipoMisterio tipo) {
    switch (tipo) {
      case TipoMisterio.gozosos:
        return misteriosGozosos;
      case TipoMisterio.dolorosos:
        return misteriosDolorosos;
      case TipoMisterio.gloriosos:
        return misteriosGloriosos;
      case TipoMisterio.luminosos:
        return misteriosLuminosos;
    }
  }
}

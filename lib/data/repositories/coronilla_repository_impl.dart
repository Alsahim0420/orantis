import '../../domain/entities/coronilla_entity.dart';
import '../../domain/repositories/coronilla_repository.dart';

class CoronillaRepositoryImpl implements CoronillaRepository {
  @override
  Future<CoronillaEntity> getCoronilla() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 500));

    return const CoronillaEntity(
      title: 'Coronilla de la Divina Misericordia',
      description:
          'Reza esta coronilla para obtener la misericordia de Dios y la gracia de una buena muerte.',
      openingPrayers: [
        'Padre Nuestro',
        'Ave María',
        'Credo',
      ],
      closingPrayers: [
        'Padre Nuestro',
        'Ave María',
        'Credo',
        'Padre Eterno',
      ],
      decades: [
        CoronillaDecadeEntity(
          number: 1,
          title: 'Primera Decena',
          mystery: 'Por la señal de la Santa Cruz',
          prayer:
              'Padre Eterno, te ofrezco el Cuerpo y la Sangre, el Alma y la Divinidad de tu Amadísimo Hijo, nuestro Señor Jesucristo, como propiciación de nuestros pecados y los del mundo entero.',
          repetitions: 1,
        ),
        CoronillaDecadeEntity(
          number: 2,
          title: 'Segunda Decena',
          mystery: 'Por la señal de la Santa Cruz',
          prayer:
              'Por su dolorosa Pasión, ten misericordia de nosotros y del mundo entero.',
          repetitions: 10,
        ),
        CoronillaDecadeEntity(
          number: 3,
          title: 'Tercera Decena',
          mystery: 'Por la señal de la Santa Cruz',
          prayer:
              'Padre Eterno, te ofrezco el Cuerpo y la Sangre, el Alma y la Divinidad de tu Amadísimo Hijo, nuestro Señor Jesucristo, como propiciación de nuestros pecados y los del mundo entero.',
          repetitions: 1,
        ),
        CoronillaDecadeEntity(
          number: 4,
          title: 'Cuarta Decena',
          mystery: 'Por la señal de la Santa Cruz',
          prayer:
              'Por su dolorosa Pasión, ten misericordia de nosotros y del mundo entero.',
          repetitions: 10,
        ),
        CoronillaDecadeEntity(
          number: 5,
          title: 'Quinta Decena',
          mystery: 'Por la señal de la Santa Cruz',
          prayer:
              'Padre Eterno, te ofrezco el Cuerpo y la Sangre, el Alma y la Divinidad de tu Amadísimo Hijo, nuestro Señor Jesucristo, como propiciación de nuestros pecados y los del mundo entero.',
          repetitions: 1,
        ),
      ],
    );
  }

  @override
  Future<List<CoronillaStepEntity>> getCoronillaSteps() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      // Oración inicial
      const CoronillaStepEntity(
        title: 'Señal de la Cruz',
        content:
            'En el nombre del Padre, y del Hijo, y del Espíritu Santo. Amén.',
        isPrayer: true,
      ),

      // Padre Nuestro
      const CoronillaStepEntity(
        title: 'Padre Nuestro',
        content:
            'Padre nuestro que estás en el cielo, santificado sea tu nombre; venga a nosotros tu reino; hágase tu voluntad en la tierra como en el cielo. Danos hoy nuestro pan de cada día; perdona nuestras ofensas, como también nosotros perdonamos a los que nos ofenden; no nos dejes caer en la tentación, y líbranos del mal. Amén.',
        isPrayer: true,
      ),

      // Ave María
      const CoronillaStepEntity(
        title: 'Ave María',
        content:
            'Dios te salve, María, llena eres de gracia, el Señor es contigo; bendita tú eres entre todas las mujeres, y bendito es el fruto de tu vientre, Jesús. Santa María, Madre de Dios, ruega por nosotros, pecadores, ahora y en la hora de nuestra muerte. Amén.',
        isPrayer: true,
      ),

      // Credo
      const CoronillaStepEntity(
        title: 'Credo',
        content:
            'Creo en Dios, Padre todopoderoso, Creador del cielo y de la tierra. Creo en Jesucristo, su único Hijo, nuestro Señor, que fue concebido por obra y gracia del Espíritu Santo, nació de Santa María Virgen, padeció bajo el poder de Poncio Pilato, fue crucificado, muerto y sepultado, descendió a los infiernos, al tercer día resucitó de entre los muertos, subió a los cielos y está sentado a la derecha de Dios, Padre todopoderoso. Desde allí ha de venir a juzgar a vivos y muertos. Creo en el Espíritu Santo, la santa Iglesia católica, la comunión de los santos, el perdón de los pecados, la resurrección de la carne y la vida eterna. Amén.',
        isPrayer: true,
      ),

      // Primera decena
      const CoronillaStepEntity(
        title: 'Primera Decena',
        content:
            'Padre Eterno, te ofrezco el Cuerpo y la Sangre, el Alma y la Divinidad de tu Amadísimo Hijo, nuestro Señor Jesucristo, como propiciación de nuestros pecados y los del mundo entero.',
        isPrayer: true,
        decadeNumber: 1,
        repetitionNumber: 1,
      ),

      // Segunda decena (10 veces)
      ...List.generate(
          10,
          (index) => CoronillaStepEntity(
                title: 'Segunda Decena - ${index + 1}',
                content:
                    'Por su dolorosa Pasión, ten misericordia de nosotros y del mundo entero.',
                isPrayer: true,
                decadeNumber: 2,
                repetitionNumber: index + 1,
              )),

      // Tercera decena
      const CoronillaStepEntity(
        title: 'Tercera Decena',
        content:
            'Padre Eterno, te ofrezco el Cuerpo y la Sangre, el Alma y la Divinidad de tu Amadísimo Hijo, nuestro Señor Jesucristo, como propiciación de nuestros pecados y los del mundo entero.',
        isPrayer: true,
        decadeNumber: 3,
        repetitionNumber: 1,
      ),

      // Cuarta decena (10 veces)
      ...List.generate(
          10,
          (index) => CoronillaStepEntity(
                title: 'Cuarta Decena - ${index + 1}',
                content:
                    'Por su dolorosa Pasión, ten misericordia de nosotros y del mundo entero.',
                isPrayer: true,
                decadeNumber: 4,
                repetitionNumber: index + 1,
              )),

      // Quinta decena
      const CoronillaStepEntity(
        title: 'Quinta Decena',
        content:
            'Padre Eterno, te ofrezco el Cuerpo y la Sangre, el Alma y la Divinidad de tu Amadísimo Hijo, nuestro Señor Jesucristo, como propiciación de nuestros pecados y los del mundo entero.',
        isPrayer: true,
        decadeNumber: 5,
        repetitionNumber: 1,
      ),

      // Padre Eterno (3 veces)
      ...List.generate(
          3,
          (index) => CoronillaStepEntity(
                title: 'Padre Eterno - ${index + 1}',
                content:
                    'Padre Eterno, te ofrezco el Cuerpo y la Sangre, el Alma y la Divinidad de tu Amadísimo Hijo, nuestro Señor Jesucristo, como propiciación de nuestros pecados y los del mundo entero.',
                isPrayer: true,
                repetitionNumber: index + 1,
              )),

      // Oración final
      const CoronillaStepEntity(
        title: 'Oración Final',
        content:
            '¡Oh Sangre y Agua que brotaste del Corazón de Jesús como una Fuente de Misericordia para nosotros, en Ti confío!',
        isPrayer: true,
      ),
    ];
  }
}
